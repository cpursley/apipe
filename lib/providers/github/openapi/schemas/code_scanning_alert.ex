defmodule GitHubOpenAPI.CodeScanningAlert do
  @moduledoc """
  Provides struct and type for a CodeScanningAlert
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t(),
          dismissed_at: DateTime.t(),
          dismissed_by: GitHubOpenAPI.NullableSimpleUser.t(),
          dismissed_comment: String.t() | nil,
          dismissed_reason: String.t(),
          fixed_at: DateTime.t() | nil,
          html_url: String.t(),
          instances_url: String.t(),
          most_recent_instance: GitHubOpenAPI.CodeScanningAlertInstance.t(),
          number: integer,
          rule: GitHubOpenAPI.CodeScanningAlertRule.t(),
          state: String.t(),
          tool: GitHubOpenAPI.CodeScanningAnalysisTool.t(),
          updated_at: DateTime.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :created_at,
    :dismissed_at,
    :dismissed_by,
    :dismissed_comment,
    :dismissed_reason,
    :fixed_at,
    :html_url,
    :instances_url,
    :most_recent_instance,
    :number,
    :rule,
    :state,
    :tool,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      dismissed_at: {:string, :date_time},
      dismissed_by: {GitHubOpenAPI.NullableSimpleUser, :t},
      dismissed_comment: {:string, :generic},
      dismissed_reason: {:enum, ["false positive", "won't fix", "used in tests"]},
      fixed_at: {:string, :date_time},
      html_url: {:string, :uri},
      instances_url: {:string, :uri},
      most_recent_instance: {GitHubOpenAPI.CodeScanningAlertInstance, :t},
      number: :integer,
      rule: {GitHubOpenAPI.CodeScanningAlertRule, :t},
      state: {:enum, ["open", "dismissed", "fixed"]},
      tool: {GitHubOpenAPI.CodeScanningAnalysisTool, :t},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
