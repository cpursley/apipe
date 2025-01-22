defmodule GitHubOpenAPI.RepositoryAdvisoryUpdateVulnerabilitiesPackage do
  @moduledoc """
  Provides struct and type for a RepositoryAdvisoryUpdateVulnerabilitiesPackage
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          ecosystem: String.t(),
          name: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :ecosystem, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ecosystem:
        {:enum,
         [
           "rubygems",
           "npm",
           "pip",
           "maven",
           "nuget",
           "composer",
           "go",
           "rust",
           "erlang",
           "actions",
           "pub",
           "other",
           "swift"
         ]},
      name: {:string, :generic}
    ]
  end
end
