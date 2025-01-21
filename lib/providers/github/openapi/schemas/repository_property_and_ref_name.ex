defmodule GitHubOpenAPI.RepositoryPropertyAndRefName do
  @moduledoc """
  Provides struct and type for a RepositoryPropertyAndRefName
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          ref_name: map | nil,
          repository_property:
            GitHubOpenAPI.RepositoryPropertyAndRefNameRepositoryProperty.t() | nil
        }

  defstruct [:__info__, :__joins__, :ref_name, :repository_property]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ref_name: :map,
      repository_property: {GitHubOpenAPI.RepositoryPropertyAndRefNameRepositoryProperty, :t}
    ]
  end
end
