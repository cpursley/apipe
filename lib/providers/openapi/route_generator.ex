defmodule Apipe.Providers.OpenAPI.RouteGenerator do
  @moduledoc """
  Generates route modules from OpenAPI specifications.

  This module is responsible for converting OpenAPI specifications into Elixir modules
  that handle route matching, schema resolution, and validation. It works in conjunction
  with the OpenAPI components to generate a complete routing system for API providers.

  The generator:
  - Extracts routes and schemas from the OpenAPI spec
  - Generates route matching and validation logic
  - Creates schema resolution functions
  - Compiles the resulting module for immediate use
  """

  alias Apipe.Providers.OpenAPI.Components.{
    MatchRouter,
    SchemaResolver,
    RouteValidator
  }

  require Logger

  @doc """
  Generates a route module from an OpenAPI specification file.

  Takes a specification file path and provider name, reads the OpenAPI spec,
  and generates a corresponding route module with matching, validation, and
  schema resolution capabilities.

  ## Parameters

    * `spec_file` - Path to the OpenAPI specification file
    * `provider` - Name of the provider (e.g., "github", "gitlab")

  The generator will:
  1. Read and parse the OpenAPI specification
  2. Extract routes and their corresponding schemas
  3. Generate the route module with all necessary functions
  4. Write and compile the module for immediate use
  """
  def run(spec_file, provider) do
    Logger.info("Generating routes for #{provider} from #{spec_file}")

    with {:ok, spec} <- YamlElixir.read_from_file(spec_file),
         base_module =
           Application.get_env(:oapi_generator, String.to_atom(String.downcase(provider)))[
             :output
           ][:base_module],
         routes <- extract_routes(spec, base_module),
         {:ok, content} <- generate_module(provider, routes) do
      write_to_file(provider, content)
    end
  end

  defp extract_routes(%{"paths" => paths}, base_module) do
    # For now, just extract the repos path as proof of concept
    case Map.get(paths, "/repos/{owner}/{repo}") do
      %{"get" => operation} ->
        %{
          "repos/{owner}/{repo}" => %{
            method: :get,
            response_schema: extract_response_schema(operation, base_module),
            operation_id: operation["operationId"],
            summary: operation["summary"]
          }
        }

      _ ->
        %{}
    end
  end

  defp extract_response_schema(
         %{
           "responses" => %{
             "200" => %{"content" => %{"application/json" => %{"schema" => %{"$ref" => ref}}}}
           }
         },
         base_module
       ) do
    schema_name =
      ref
      |> String.replace("#/components/schemas/", "")
      |> String.split("-")
      |> Enum.map(&Macro.camelize/1)
      |> Enum.join()

    Module.concat([base_module, schema_name])
  end

  defp generate_module(provider, routes) do
    # Keep provider name as is, let the mix task handle any casing
    module_name = Module.concat(["Apipe", "Providers", provider, "Routes"])

    components = [
      MatchRouter.generate(routes),
      SchemaResolver.generate(routes),
      RouteValidator.generate(routes)
    ]

    content =
      quote do
        defmodule unquote(module_name) do
          @moduledoc "OpenAPI generated route registry"

          @behaviour Apipe.Providers.OpenAPI.Routes

          @routes unquote(Macro.escape(routes))

          unquote_splicing(components)

          # Add before_compile hook for proper compilation order
          defmacro __before_compile__(_env) do
            quote do
              # This ensures the routes module is compiled before any module that uses it
            end
          end

          # Add a catch-all match_route function that returns an Apipe.Error
          def match_route(path) do
            %Apipe.Error{
              type: :validation_error,
              message: "Route not found",
              details: %{
                path: path
              }
            }
          end
        end
      end

    {:ok, content}
  end

  defp write_to_file(provider, content) do
    # Use lowercase for directory name but preserve casing for module
    output_path = "lib/providers/#{String.downcase(provider)}/routes.ex"
    File.mkdir_p!(Path.dirname(output_path))

    formatted_content = Code.format_string!(Macro.to_string(content))
    File.write!(output_path, formatted_content)

    # Compile the routes module
    Code.compile_file(output_path)

    Logger.info("Generated #{output_path}")
  end
end
