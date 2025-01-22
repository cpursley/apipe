defmodule Apipe.Providers.OpenAPI.EctoGenerator do
  @moduledoc """
  Generates Ecto embedded schemas from OpenAPI specifications.

  This module converts OpenAPI schemas into Ecto embedded schemas with:
  - Proper field types
  - Embedded associations
  - Changesets with validations
  - Support for Apipe's join system
  """

  require Logger

  @doc """
  Generates Ecto schema modules from an OpenAPI specification file.

  Takes a specification file path and provider name, reads the OpenAPI spec,
  and generates corresponding Ecto schema modules with proper types and validations.

  ## Parameters
    * `spec_file` - Path to the OpenAPI specification file
    * `provider` - Name of the provider (e.g., "github", "gitlab")
  """
  def run(spec_file, provider) do
    Logger.info("Generating Ecto schemas for #{provider} from #{spec_file}")

    with {:ok, spec} <- YamlElixir.read_from_file(spec_file),
         schemas <- get_in(spec, ["components", "schemas"]) do
      output_dir = get_output_dir(provider)
      File.mkdir_p!(output_dir)

      schemas
      |> Enum.each(fn {name, schema} ->
        content = generate_schema(sanitize_name(name), schema, schemas, provider)
        file_path = Path.join(output_dir, "#{Macro.underscore(sanitize_name(name))}.ex")
        File.write!(file_path, content)
      end)
    end
  end

  defp generate_schema(name, schema, all_schemas, provider) do
    fields = get_fields(schema, all_schemas, provider)
    changeset = get_changeset(schema, all_schemas, provider)

    """
    defmodule #{get_module_prefix(provider)}.#{name} do
      use Ecto.Schema
      import Ecto.Changeset

      @primary_key false
      embedded_schema do
        #{fields}
      end

      def changeset(schema, attrs) do
        schema
        |> cast(attrs, [#{get_field_atoms(schema, all_schemas)}])
        #{changeset}
      end
    end
    """
  end

  defp get_fields(schema, all_schemas, provider) do
    fields =
      get_properties(schema, all_schemas)
      |> Enum.map(fn {name, prop} ->
        {name, prop,
         cond do
           is_additional_properties_ref?(prop) ->
             value_type = get_type(prop["additionalProperties"], all_schemas, provider)
             {:embed, "embeds_many :#{sanitize_field_name(name)}, #{value_type}"}

           is_ref?(prop) ->
             {:embed,
              "embeds_one :#{sanitize_field_name(name)}, #{get_type(prop, all_schemas, provider)}"}

           is_array_of_refs?(prop) ->
             ref_type = get_module_name(prop["items"]["$ref"], provider)
             {:embed, "embeds_many :#{sanitize_field_name(name)}, #{ref_type}"}

           is_array?(prop) ->
             {:field,
              "field :#{quote_field_name(name)}, {:array, #{get_array_type(prop["items"], all_schemas, provider)}}"}

           true ->
             {:field,
              "field :#{quote_field_name(name)}, #{get_type(prop, all_schemas, provider)}"}
         end}
      end)
      |> Enum.sort_by(fn {_, _, {type, _}} -> if type == :field, do: 0, else: 1 end)
      |> Enum.map(fn {_, _, {_, field}} -> field end)
      |> Enum.join("\n    ")

    fields <> "\n    field :__info__, :map\n    field :__joins__, {:array, :map}"
  end

  defp quote_field_name(name) do
    # Quote field names that:
    # 1. Start with numbers or special chars
    # 2. Contain any non-alphanumeric characters
    if String.match?(name, ~r/^[0-9+\-]|[^a-zA-Z0-9_]/) do
      ~s("#{name}")
    else
      sanitize_field_name(name)
    end
  end

  defp is_additional_properties_ref?(prop) when is_map(prop) do
    prop["type"] == "object" &&
      Map.has_key?(prop, "additionalProperties") &&
      is_ref?(prop["additionalProperties"])
  end

  defp is_additional_properties_ref?(_), do: false

  defp is_ref?(prop) when is_map(prop) do
    Map.has_key?(prop, "$ref") ||
      (Map.has_key?(prop, "allOf") && hd(prop["allOf"]) |> Map.has_key?("$ref"))
  end

  defp is_ref?(_), do: false

  defp is_array_of_refs?(%{"type" => "array", "items" => %{"$ref" => _}}), do: true
  defp is_array_of_refs?(_), do: false

  defp is_array?(%{"type" => "array"}), do: true
  defp is_array?(_), do: false

  defp get_properties(%{"allOf" => [%{"$ref" => ref} | _]}, all_schemas) do
    get_ref_schema(ref, all_schemas)
    |> get_properties(all_schemas)
  end

  defp get_properties(schema, all_schemas) do
    case schema do
      %{"properties" => props} ->
        props

      %{"allOf" => schemas} ->
        schemas
        |> Enum.flat_map(fn s ->
          case s do
            %{"$ref" => ref} -> get_properties(get_ref_schema(ref, all_schemas), all_schemas)
            %{"properties" => props} -> Map.to_list(props)
            _ -> []
          end
        end)
        |> Map.new()

      _ ->
        %{}
    end
  end

  defp get_type(%{"allOf" => [%{"$ref" => ref} | _]}, _all_schemas, provider) do
    get_module_name(ref, provider)
  end

  defp get_type(%{"$ref" => ref}, all_schemas, provider) do
    case get_ref_schema(ref, all_schemas) do
      nil -> ":map"
      _ -> get_module_name(ref, provider)
    end
  end

  defp get_type(prop, all_schemas, provider) when is_map(prop) do
    cond do
      Map.has_key?(prop, "$ref") ->
        get_module_name(prop["$ref"], provider)

      Map.has_key?(prop, "type") ->
        case prop["type"] do
          "object" ->
            cond do
              Map.has_key?(prop, "additionalProperties") ->
                additional_prop_type =
                  get_type(prop["additionalProperties"], all_schemas, provider)

                "{:map, #{additional_prop_type}}"

              Map.has_key?(prop, "properties") ->
                ":map"

              true ->
                ":map"
            end

          "string" ->
            if Map.has_key?(prop, "enum") do
              values =
                prop["enum"]
                |> Enum.reject(&is_nil/1)
                |> Enum.map(&to_atom_string/1)
                |> Enum.join(", ")

              "Ecto.Enum, values: [#{values}]"
            else
              ":string"
            end

          "integer" ->
            if Map.has_key?(prop, "enum") do
              values =
                prop["enum"]
                |> Enum.reject(&is_nil/1)
                |> Enum.map(&to_string/1)
                |> Enum.map(&to_atom_string/1)
                |> Enum.join(", ")

              "Ecto.Enum, values: [#{values}]"
            else
              ":integer"
            end

          "number" ->
            ":float"

          "boolean" ->
            ":boolean"

          "array" ->
            "{:array, #{get_array_type(prop["items"], all_schemas, provider)}}"

          _ ->
            ":string"
        end

      true ->
        ":map"
    end
  end

  defp get_type(_, _, _), do: ":string"

  defp get_array_type(%{"$ref" => ref}, _all_schemas, provider),
    do: get_module_name(ref, provider)

  defp get_array_type(%{"type" => type}, _all_schemas, _provider) do
    case type do
      "string" -> ":string"
      "integer" -> ":integer"
      "number" -> ":float"
      "boolean" -> ":boolean"
      _ -> ":string"
    end
  end

  defp get_array_type(_, _, _), do: ":string"

  defp get_field_atoms(schema, all_schemas) do
    get_properties(schema, all_schemas)
    |> Enum.reject(fn {_, prop} -> is_embed?(prop) end)
    |> Enum.map(fn {name, _} ->
      if String.match?(name, ~r/^[0-9+\-]|[^a-zA-Z0-9_]/) do
        ~s(:"#{name}")
      else
        ":#{sanitize_field_name(name)}"
      end
    end)
    |> Enum.concat([":__info__", ":__joins__"])
    |> Enum.join(", ")
  end

  defp is_embed?(prop) do
    cond do
      Map.has_key?(prop, "$ref") -> true
      Map.has_key?(prop, "allOf") -> true
      is_array_of_refs?(prop) -> true
      Map.has_key?(prop, "type") && prop["type"] == "object" -> true
      true -> false
    end
  end

  defp get_changeset(schema, all_schemas, provider) do
    validations =
      [
        get_required_validation(schema),
        get_nested_validations(schema, all_schemas, provider)
      ]
      |> Enum.reject(&is_nil/1)
      |> Enum.join("\n    ")

    if validations == "", do: "", else: "    #{validations}"
  end

  defp get_required_validation(_), do: nil

  defp get_nested_validations(schema, all_schemas, provider) do
    get_properties(schema, all_schemas)
    |> Enum.map(fn {name, prop} -> get_nested_validation(name, prop, provider) end)
    |> Enum.reject(&is_nil/1)
    |> Enum.join("\n    ")
  end

  defp get_nested_validation(name, %{"$ref" => ref}, provider) do
    module_name = get_module_name(ref, provider)
    "|> cast_embed(:#{sanitize_field_name(name)}, with: &#{module_name}.changeset/2)"
  end

  defp get_nested_validation(name, %{"type" => "array", "items" => %{"$ref" => ref}}, provider) do
    module_name = get_module_name(ref, provider)
    "|> cast_embed(:#{sanitize_field_name(name)}, with: &#{module_name}.changeset/2)"
  end

  defp get_nested_validation(_, _, _), do: nil

  defp get_ref_schema(ref, all_schemas) do
    name = ref |> String.replace("#/components/schemas/", "")
    Map.get(all_schemas, name)
  end

  defp get_module_name(ref, provider) when is_binary(ref) do
    ref
    |> String.replace("#/components/schemas/", "")
    |> sanitize_name()
    |> then(&"#{get_module_prefix(provider)}.#{&1}")
  end

  defp get_module_name(_, _), do: "UnknownSchema"

  defp get_module_prefix(provider) do
    provider
    |> to_string()
    |> Macro.camelize()
    |> then(&"#{&1}OpenAPI")
  end

  defp get_output_dir(provider) do
    Path.join([
      "lib",
      "providers",
      String.downcase(provider),
      "openapi",
      "schemas"
    ])
  end

  defp sanitize_name(name) do
    name
    |> String.split([".", "-"])
    |> Enum.map(&Macro.camelize/1)
    |> Enum.join("")
  end

  defp sanitize_field_name(name) do
    name
    |> String.split(".")
    |> Enum.map(&Macro.underscore/1)
    |> Enum.join("_")
  end

  defp needs_quotes?(nil), do: false

  defp needs_quotes?(value) when is_binary(value) do
    String.match?(value, ~r/[^a-z0-9_]|^[0-9]|[A-Z]/)
  end

  defp to_atom_string(nil), do: ":nil"

  defp to_atom_string(value) when is_binary(value) do
    if needs_quotes?(value) do
      ~s(:"#{value}")
    else
      ":" <> value
    end
  end
end
