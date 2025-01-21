defmodule GitHubOpenAPI.ReleaseAsset do
  @moduledoc """
  Provides struct and type for a ReleaseAsset
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          browser_download_url: String.t(),
          content_type: String.t(),
          created_at: DateTime.t(),
          download_count: integer,
          id: integer,
          label: String.t() | nil,
          name: String.t(),
          node_id: String.t(),
          size: integer,
          state: String.t(),
          updated_at: DateTime.t(),
          uploader: GitHubOpenAPI.SimpleUser.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :browser_download_url,
    :content_type,
    :created_at,
    :download_count,
    :id,
    :label,
    :name,
    :node_id,
    :size,
    :state,
    :updated_at,
    :uploader,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      browser_download_url: {:string, :uri},
      content_type: {:string, :generic},
      created_at: {:string, :date_time},
      download_count: :integer,
      id: :integer,
      label: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic},
      node_id: {:string, :generic},
      size: :integer,
      state: {:enum, ["uploaded", "open"]},
      updated_at: {:string, :date_time},
      uploader: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      url: {:string, :uri}
    ]
  end
end
