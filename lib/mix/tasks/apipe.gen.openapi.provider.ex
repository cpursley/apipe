defmodule Mix.Tasks.Apipe.Gen.Openapi.Provider do
  @moduledoc """
  Generates route modules and schema modules for Apipe providers from OpenAPI specifications.

  The task can read specifications from either a local file or a URL:

  ## Local file
      mix apipe.gen.openapi.provider path/to/spec.{yaml,json} provider_name [--module-name NAME]

  ## Remote URL
      mix apipe.gen.openapi.provider --url https://example.com/openapi.{yaml,json} provider_name [--module-name NAME]

  Options:
    * `--module-name` - Override the default module name (defaults to provider name camelized)

  The generated modules will handle:
  - Route matching and validation
  - Schema resolution
  - Type integration with the provider's type system
  - Ecto embedded schemas
  """

  @shortdoc "Generates route and schema modules from OpenAPI specifications"

  use Mix.Task
  require Logger

  @recursive true

  @impl Mix.Task
  def run(["--url", url, provider | rest]) do
    {opts, []} = OptionParser.parse!(rest, strict: [module_name: :string])
    Application.ensure_all_started(:req)

    case get_spec({:url, url}) do
      {:ok, spec_content} ->
        spec_path = write_temp_spec(spec_content, url)
        generate_modules(spec_path, provider, opts)
        File.rm(spec_path)

      {:error, reason} ->
        Mix.raise("Failed to get OpenAPI spec: #{inspect(reason)}")
    end
  end

  def run([path, provider | rest]) do
    {opts, []} = OptionParser.parse!(rest, strict: [module_name: :string])
    process_spec({:file, path}, provider, opts)
  end

  def run(_) do
    Mix.raise("""
    Invalid arguments.

    Usage:
      mix apipe.gen.openapi.provider path/to/spec.{yaml,json} provider_name [--module-name NAME]
      mix apipe.gen.openapi.provider --url https://example.com/openapi.{yaml,json} provider_name [--module-name NAME]

    Options:
      --module-name NAME    Override the default module name
    """)
  end

  defp process_spec(source, provider, opts) do
    Application.ensure_all_started(:req)
    Application.ensure_all_started(:yaml_elixir)
    Application.ensure_all_started(:jason)

    case get_spec(source) do
      {:ok, spec_content} ->
        spec_path = write_temp_spec(spec_content, source)
        generate_modules(spec_path, provider, opts)
        File.rm(spec_path)

      {:error, reason} ->
        Mix.raise("Failed to get OpenAPI spec: #{inspect(reason)}")
    end
  end

  defp generate_modules(spec_path, provider, opts) do
    module_name = opts[:module_name] || provider
    Logger.debug("Generating modules for #{provider} with module_name: #{module_name}")

    case parse_spec(spec_path) do
      {:ok, spec} when is_map(spec) ->
        Logger.debug("Successfully parsed spec file for task")

        tasks = [
          Task.async(fn ->
            Logger.debug("Starting RouteGenerator")
            result = Apipe.Providers.OpenAPI.RouteGenerator.run(spec_path, module_name)
            Logger.debug("Completed RouteGenerator: #{inspect(result)}")
            result
          end),
          Task.async(fn ->
            Logger.debug("Starting EctoGenerator")
            result = Apipe.Providers.OpenAPI.EctoGenerator.run(spec_path, module_name)
            Logger.debug("Completed EctoGenerator: #{inspect(result)}")
            result
          end)
        ]

        Logger.debug("Awaiting task completion")
        Task.await_many(tasks, 30_000)
        Logger.debug("All tasks completed")

      {:ok, nil} ->
        Logger.error("Empty spec file in task")
        Mix.raise("OpenAPI spec is empty or invalid")

      {:error, reason} ->
        Logger.error("Failed to parse spec in task: #{inspect(reason)}")
        Mix.raise("Failed to parse OpenAPI spec: #{inspect(reason)}")
    end
  end

  def parse_spec(path) when is_binary(path) do
    cond do
      String.ends_with?(path, ".json") ->
        parse_json_spec(path)

      String.ends_with?(path, ".yaml") or String.ends_with?(path, ".yml") ->
        parse_yaml_spec(path)

      true ->
        Logger.error("Unknown spec file type: #{path}")
        Mix.raise("Unsupported spec file type. Must be .yaml, .yml, or .json")
    end
  end

  defp parse_json_spec(path) do
    Logger.debug("Parsing JSON spec file")

    case File.read(path) do
      {:ok, content} -> Jason.decode(content)
      error -> error
    end
  end

  defp parse_yaml_spec(path) do
    Logger.debug("Parsing YAML spec file")
    YamlElixir.read_from_file(path)
  end

  defp get_spec({:file, path}) do
    case File.read(path) do
      {:ok, content} -> {:ok, content}
      {:error, reason} -> {:error, "Failed to read file: #{inspect(reason)}"}
    end
  end

  defp get_spec({:url, url}) do
    case Req.get(url) do
      {:ok, %{status: 200, body: body}} -> {:ok, body}
      {:ok, resp} -> {:error, "HTTP request failed: #{inspect(resp)}"}
      {:error, reason} -> {:error, reason}
    end
  end

  defp write_temp_spec(content, source) when is_binary(source) do
    ext = Path.extname(source)
    path = Path.join(System.tmp_dir!(), "openapi_spec_#{:erlang.unique_integer()}#{ext}")
    File.write!(path, content)
    path
  end

  defp write_temp_spec(content, {:file, source}) do
    write_temp_spec(content, source)
  end

  defp write_temp_spec(content, {:url, url}) do
    write_temp_spec(content, url)
  end
end
