defmodule GitHubOpenAPI.RepositoryNameAndRefName do
  @moduledoc """
  Provides struct and type for a RepositoryNameAndRefName
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          ref_name: map | nil,
          repository_name: GitHubOpenAPI.RepositoryNameAndRefNameRepositoryName.t() | nil
        }

  defstruct [:__info__, :ref_name, :repository_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ref_name: :map, repository_name: {GitHubOpenAPI.RepositoryNameAndRefNameRepositoryName, :t}]
  end
end
