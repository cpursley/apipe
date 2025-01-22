defmodule GitHubOpenAPI.CommunityProfile do
  @moduledoc """
  Provides struct and type for a CommunityProfile
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          content_reports_enabled: boolean | nil,
          description: String.t() | nil,
          documentation: String.t() | nil,
          files: GitHubOpenAPI.CommunityProfileFiles.t(),
          health_percentage: integer,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :content_reports_enabled,
    :description,
    :documentation,
    :files,
    :health_percentage,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_reports_enabled: :boolean,
      description: {:string, :generic},
      documentation: {:string, :generic},
      files: {GitHubOpenAPI.CommunityProfileFiles, :t},
      health_percentage: :integer,
      updated_at: {:string, :date_time}
    ]
  end
end
