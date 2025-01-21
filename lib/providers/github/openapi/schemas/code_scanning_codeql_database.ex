defmodule GitHubOpenAPI.CodeScanningCodeqlDatabase do
  @moduledoc """
  Provides struct and type for a CodeScanningCodeqlDatabase
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          commit_oid: String.t() | nil,
          content_type: String.t(),
          created_at: DateTime.t(),
          id: integer,
          language: String.t(),
          name: String.t(),
          size: integer,
          updated_at: DateTime.t(),
          uploader: GitHubOpenAPI.SimpleUser.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :commit_oid,
    :content_type,
    :created_at,
    :id,
    :language,
    :name,
    :size,
    :updated_at,
    :uploader,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit_oid: {:union, [{:string, :generic}, :null]},
      content_type: {:string, :generic},
      created_at: {:string, :date_time},
      id: :integer,
      language: {:string, :generic},
      name: {:string, :generic},
      size: :integer,
      updated_at: {:string, :date_time},
      uploader: {GitHubOpenAPI.SimpleUser, :t},
      url: {:string, :uri}
    ]
  end
end
