defmodule GitHubOpenAPI.NullableLicenseSimple do
  @moduledoc """
  Provides struct and type for a NullableLicenseSimple
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          html_url: String.t() | nil,
          key: String.t(),
          name: String.t(),
          node_id: String.t(),
          spdx_id: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :html_url, :key, :name, :node_id, :spdx_id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html_url: {:string, :uri},
      key: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      spdx_id: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
