defmodule GitHubOpenAPI.PackageVersionMetadata do
  @moduledoc """
  Provides struct and type for a PackageVersionMetadata
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          container: GitHubOpenAPI.ContainerMetadata.t() | nil,
          docker: GitHubOpenAPI.DockerMetadata.t() | nil,
          package_type: String.t()
        }

  defstruct [:__info__, :__joins__, :container, :docker, :package_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      container: {GitHubOpenAPI.ContainerMetadata, :t},
      docker: {GitHubOpenAPI.DockerMetadata, :t},
      package_type: {:enum, ["npm", "maven", "rubygems", "docker", "nuget", "container"]}
    ]
  end
end
