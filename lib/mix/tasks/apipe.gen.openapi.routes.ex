defmodule Mix.Tasks.Apipe.Gen.Openapi.Routes do
  @moduledoc """
  Generates route modules for Apipe providers from OpenAPI specifications.

  This task generates a provider's route module that handles path matching,
  schema resolution, and response validation. It works in conjunction with
  oapi_generator to create a type-safe interface between Apipe and the API.
  """

  @shortdoc "Generates route modules from OpenAPI specs"

  use Mix.Task

  # Make sure routes are generated before compilation
  @recursive true

  @doc """
  Runs the route generator for a given OpenAPI specification.

  ## Usage

      mix apipe.gen.openapi.routes SPEC_FILE PROVIDER [--module-name NAME]

  ## Arguments

    * `SPEC_FILE` - Path to the OpenAPI specification file
    * `PROVIDER` - Provider name (e.g. github, gitlab)
    * `--module-name` - Optional module name override for the provider

  ## Examples

      mix apipe.gen.openapi.routes spec/github.yaml github
      mix apipe.gen.openapi.routes spec/gitlab.yaml gitlab --module-name GitLab
  """
  def run([spec_file, provider | args]) do
    {opts, _} = OptionParser.parse!(args, strict: [module_name: :string])

    # Handle provider name casing - use module_name if provided, otherwise camelize
    provider_name = opts[:module_name] || Macro.camelize(provider)

    Application.ensure_all_started(:apipe)
    Apipe.Providers.OpenAPI.RouteGenerator.run(spec_file, provider_name)
  end

  def run(_) do
    Mix.raise("""
    Invalid arguments. Usage:
        mix apipe.gen.openapi.routes SPEC_FILE PROVIDER [--module-name NAME]
    """)
  end
end
