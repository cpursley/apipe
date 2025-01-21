defmodule GitHubOpenAPI.ActionsCacheList do
  @moduledoc """
  Provides struct and type for a ActionsCacheList
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          actions_caches: [GitHubOpenAPI.ActionsCacheListActionsCaches.t()],
          total_count: integer
        }

  defstruct [:__info__, :__joins__, :actions_caches, :total_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [actions_caches: [{GitHubOpenAPI.ActionsCacheListActionsCaches, :t}], total_count: :integer]
  end
end
