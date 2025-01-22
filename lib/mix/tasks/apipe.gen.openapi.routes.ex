defmodule Mix.Tasks.Apipe.Gen.Openapi.Routes do
  @moduledoc """
  Generates route modules for Apipe providers from OpenAPI specifications.

  The task can read specifications from either a local file or a URL:

  ## Local file
      mix apipe.gen.openapi.routes path/to/spec.yaml provider_name [--module-name NAME]

  ## Remote URL
      mix apipe.gen.openapi.routes --url https://example.com/openapi.yaml provider_name [--module-name NAME]

  Options:
    * `--module-name` - Override the default module name (defaults to provider name camelized)

  The generated module will handle:
  - Route matching and validation
  - Schema resolution
  - Type integration with the provider's type system
  """

  @shortdoc "Generates route modules from OpenAPI specifications"

  use Mix.Task
  require Logger

  # Make sure routes are generated before compilation
  @recursive true

  @impl Mix.Task
  def run(["--url", url, provider | rest]) do
    {opts, []} = OptionParser.parse!(rest, strict: [module_name: :string])
    Application.ensure_all_started(:req)

    case get_spec({:url, url}) do
      {:ok, spec_content} ->
        spec_path = write_temp_spec(spec_content)
        Apipe.Providers.OpenAPI.RouteGenerator.run(spec_path, opts[:module_name] || provider)
        File.rm(spec_path)

      {:error, reason} ->
        Mix.raise("Failed to get OpenAPI spec: #{inspect(reason)}")
    end
  end

  def run([path, provider | rest]) do
    {opts, []} = OptionParser.parse!(rest, strict: [module_name: :string])
    process_spec({:file, path}, provider, opts[:module_name])
  end

  def run(_) do
    Mix.raise("""
    Invalid arguments.

    Usage:
      mix apipe.gen.openapi.routes path/to/spec.yaml provider_name [--module-name NAME]
      mix apipe.gen.openapi.routes --url https://example.com/openapi.yaml provider_name [--module-name NAME]
    """)
  end

  defp process_spec(source, provider, module_name) do
    Application.ensure_all_started(:req)

    case get_spec(source) do
      {:ok, spec_content} ->
        spec_path = write_temp_spec(spec_content)
        Apipe.Providers.OpenAPI.RouteGenerator.run(spec_path, module_name || provider)
        File.rm(spec_path)

      {:error, reason} ->
        Mix.raise("Failed to get OpenAPI spec: #{inspect(reason)}")
    end
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

  defp write_temp_spec(content) do
    path = Path.join(System.tmp_dir!(), "openapi_spec_#{:erlang.unique_integer()}.yaml")
    File.write!(path, content)
    path
  end
end
