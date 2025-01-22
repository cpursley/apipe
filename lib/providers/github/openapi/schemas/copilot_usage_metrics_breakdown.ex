defmodule GitHubOpenAPI.CopilotUsageMetricsBreakdown do
  @moduledoc """
  Provides struct and type for a CopilotUsageMetricsBreakdown
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          acceptances_count: integer | nil,
          active_users: integer | nil,
          editor: String.t() | nil,
          language: String.t() | nil,
          lines_accepted: integer | nil,
          lines_suggested: integer | nil,
          suggestions_count: integer | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :acceptances_count,
    :active_users,
    :editor,
    :language,
    :lines_accepted,
    :lines_suggested,
    :suggestions_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      acceptances_count: :integer,
      active_users: :integer,
      editor: {:string, :generic},
      language: {:string, :generic},
      lines_accepted: :integer,
      lines_suggested: :integer,
      suggestions_count: :integer
    ]
  end
end
