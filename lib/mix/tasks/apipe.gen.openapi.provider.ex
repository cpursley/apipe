defmodule Mix.Tasks.Apipe.Gen.Openapi.Provider do
  @moduledoc """
  Generates route modules and Ecto schema modules for Apipe providers from OpenAPI specifications.

  The task can read specifications from either a local file or a URL:

  ## Local file
      mix apipe.gen.openapi.provider path/to/spec.yaml provider_name [--module-name NAME]

  ## Remote URL
      mix apipe.gen.openapi.provider --url https://example.com/openapi.yaml provider_name [--module-name NAME]

  Options:
    * `--module-name` - Override the default module name (defaults to provider name camelized)
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
        spec_path = write_temp_spec(spec_content)
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
      mix apipe.gen.openapi.provider path/to/spec.yaml provider_name [--module-name NAME]
      mix apipe.gen.openapi.provider --url https://example.com/openapi.yaml provider_name [--module-name NAME]

    Options:
      --module-name NAME    Override the default module name
    """)
  end

  defp process_spec(source, provider, opts) do
    Application.ensure_all_started(:req)

    case get_spec(source) do
      {:ok, spec_content} ->
        spec_path = write_temp_spec(spec_content)
        generate_modules(spec_path, provider, opts)
        File.rm(spec_path)

      {:error, reason} ->
        Mix.raise("Failed to get OpenAPI spec: #{inspect(reason)}")
    end
  end

  defp generate_modules(spec_path, provider, opts) do
    module_name = opts[:module_name] || provider

    Task.await_many(
      [
        Task.async(fn -> Apipe.Providers.OpenAPI.RouteGenerator.run(spec_path, module_name) end),
        Task.async(fn -> Apipe.Providers.OpenAPI.EctoGenerator.run(spec_path, module_name) end)
      ],
      30_000
    )
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
