defmodule GitHubOpenAPI.CodeScanningAlertItems do
  @moduledoc """
  Provides struct and type for a CodeScanningAlertItems
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          dismissed_at: DateTime.t() | nil,
          dismissed_by: GitHubOpenAPI.SimpleUser.t() | nil,
          dismissed_comment: String.t() | nil,
          dismissed_reason: String.t() | nil,
          fixed_at: DateTime.t() | nil,
          html_url: String.t(),
          instances_url: String.t(),
          most_recent_instance: GitHubOpenAPI.CodeScanningAlertInstance.t(),
          number: integer,
          rule: GitHubOpenAPI.CodeScanningAlertRuleSummary.t(),
          state: String.t() | nil,
          tool: GitHubOpenAPI.CodeScanningAnalysisTool.t(),
          updated_at: DateTime.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
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
      dismissed_at: {:union, [{:string, :date_time}, :null]},
      dismissed_by: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      dismissed_comment: {:union, [{:string, :generic}, :null]},
      dismissed_reason: {:enum, ["false positive", "won't fix", "used in tests", nil]},
      fixed_at: {:union, [{:string, :date_time}, :null]},
      html_url: {:string, :uri},
      instances_url: {:string, :uri},
      most_recent_instance: {GitHubOpenAPI.CodeScanningAlertInstance, :t},
      number: :integer,
      rule: {GitHubOpenAPI.CodeScanningAlertRuleSummary, :t},
      state: {:enum, ["open", "dismissed", "fixed", nil]},
      tool: {GitHubOpenAPI.CodeScanningAnalysisTool, :t},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
