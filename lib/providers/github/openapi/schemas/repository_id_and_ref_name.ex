defmodule GitHubOpenAPI.RepositoryIdAndRefName do
  @moduledoc """
  Provides struct and type for a RepositoryIdAndRefName
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          ref_name: map | nil,
          repository_id: GitHubOpenAPI.RepositoryIdAndRefNameRepositoryId.t() | nil
        }

  defstruct [:__info__, :__joins__, :ref_name, :repository_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ref_name: :map, repository_id: {GitHubOpenAPI.RepositoryIdAndRefNameRepositoryId, :t}]
  end
end
