defmodule GitHubOpenAPI.ActionsCacheUsageByRepository do
  @moduledoc """
  Provides struct and type for a ActionsCacheUsageByRepository
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          active_caches_count: integer,
          active_caches_size_in_bytes: integer,
          full_name: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :active_caches_count,
    :active_caches_size_in_bytes,
    :full_name
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_caches_count: :integer,
      active_caches_size_in_bytes: :integer,
      full_name: {:string, :generic}
    ]
  end
end
