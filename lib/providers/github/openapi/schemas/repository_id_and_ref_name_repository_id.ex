defmodule GitHubOpenAPI.RepositoryIdAndRefNameRepositoryId do
  @moduledoc """
  Provides struct and type for a RepositoryIdAndRefNameRepositoryId
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, repository_ids: [integer] | nil}

  defstruct [:__info__, :__joins__, :repository_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [repository_ids: [:integer]]
  end
end
