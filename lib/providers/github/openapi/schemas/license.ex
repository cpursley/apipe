defmodule GitHubOpenAPI.License do
  @moduledoc """
  Provides struct and type for a License
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          body: String.t(),
          conditions: [String.t()],
          description: String.t(),
          featured: boolean,
          html_url: String.t(),
          implementation: String.t(),
          key: String.t(),
          limitations: [String.t()],
          name: String.t(),
          node_id: String.t(),
          permissions: [String.t()],
          spdx_id: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :body,
    :conditions,
    :description,
    :featured,
    :html_url,
    :implementation,
    :key,
    :limitations,
    :name,
    :node_id,
    :permissions,
    :spdx_id,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      body: {:string, :generic},
      conditions: [string: :generic],
      description: {:string, :generic},
      featured: :boolean,
      html_url: {:string, :uri},
      implementation: {:string, :generic},
      key: {:string, :generic},
      limitations: [string: :generic],
      name: {:string, :generic},
      node_id: {:string, :generic},
      permissions: [string: :generic],
      spdx_id: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
