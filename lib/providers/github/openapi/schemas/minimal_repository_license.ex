defmodule GitHubOpenAPI.MinimalRepositoryLicense do
  @moduledoc """
  Provides struct and type for a MinimalRepositoryLicense
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          key: String.t() | nil,
          name: String.t() | nil,
          node_id: String.t() | nil,
          spdx_id: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :key, :name, :node_id, :spdx_id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      key: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      spdx_id: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
