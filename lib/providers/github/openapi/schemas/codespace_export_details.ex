defmodule GitHubOpenAPI.CodespaceExportDetails do
  @moduledoc """
  Provides struct and type for a CodespaceExportDetails
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          branch: String.t() | nil,
          completed_at: DateTime.t() | nil,
          export_url: String.t() | nil,
          html_url: String.t() | nil,
          id: String.t() | nil,
          sha: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :branch,
    :completed_at,
    :export_url,
    :html_url,
    :id,
    :sha,
    :state
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      branch: {:string, :generic},
      completed_at: {:string, :date_time},
      export_url: {:string, :generic},
      html_url: {:string, :generic},
      id: {:string, :generic},
      sha: {:string, :generic},
      state: {:string, :generic}
    ]
  end
end
