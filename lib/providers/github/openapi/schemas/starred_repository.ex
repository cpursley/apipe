defmodule GitHubOpenAPI.StarredRepository do
  @moduledoc """
  Provides struct and type for a StarredRepository
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          repo: GitHubOpenAPI.Repository.t(),
          starred_at: DateTime.t()
        }

  defstruct [:__info__, :__joins__, :repo, :starred_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [repo: {GitHubOpenAPI.Repository, :t}, starred_at: {:string, :date_time}]
  end
end
