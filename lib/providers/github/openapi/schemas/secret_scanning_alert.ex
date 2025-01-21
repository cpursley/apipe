defmodule GitHubOpenAPI.SecretScanningAlert do
  @moduledoc """
  Provides struct and type for a SecretScanningAlert
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t() | nil,
          html_url: String.t() | nil,
          locations_url: String.t() | nil,
          multi_repo: boolean | nil,
          number: integer | nil,
          publicly_leaked: boolean | nil,
          push_protection_bypass_request_comment: String.t() | nil,
          push_protection_bypass_request_html_url: String.t() | nil,
          push_protection_bypass_request_reviewer: GitHubOpenAPI.SimpleUser.t() | nil,
          push_protection_bypass_request_reviewer_comment: String.t() | nil,
          push_protection_bypassed: boolean | nil,
          push_protection_bypassed_at: DateTime.t() | nil,
          push_protection_bypassed_by: GitHubOpenAPI.SimpleUser.t() | nil,
          resolution: String.t() | nil,
          resolution_comment: String.t() | nil,
          resolved_at: DateTime.t() | nil,
          resolved_by: GitHubOpenAPI.SimpleUser.t() | nil,
          secret: String.t() | nil,
          secret_type: String.t() | nil,
          secret_type_display_name: String.t() | nil,
          state: String.t() | nil,
          updated_at: DateTime.t() | nil,
          url: String.t() | nil,
          validity: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :created_at,
    :html_url,
    :locations_url,
    :multi_repo,
    :number,
    :publicly_leaked,
    :push_protection_bypass_request_comment,
    :push_protection_bypass_request_html_url,
    :push_protection_bypass_request_reviewer,
    :push_protection_bypass_request_reviewer_comment,
    :push_protection_bypassed,
    :push_protection_bypassed_at,
    :push_protection_bypassed_by,
    :resolution,
    :resolution_comment,
    :resolved_at,
    :resolved_by,
    :secret,
    :secret_type,
    :secret_type_display_name,
    :state,
    :updated_at,
    :url,
    :validity
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      html_url: {:string, :uri},
      locations_url: {:string, :uri},
      multi_repo: {:union, [:boolean, :null]},
      number: :integer,
      publicly_leaked: {:union, [:boolean, :null]},
      push_protection_bypass_request_comment: {:union, [{:string, :generic}, :null]},
      push_protection_bypass_request_html_url: {:union, [{:string, :uri}, :null]},
      push_protection_bypass_request_reviewer: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      push_protection_bypass_request_reviewer_comment: {:union, [{:string, :generic}, :null]},
      push_protection_bypassed: {:union, [:boolean, :null]},
      push_protection_bypassed_at: {:union, [{:string, :date_time}, :null]},
      push_protection_bypassed_by: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      resolution: {:enum, ["false_positive", "wont_fix", "revoked", "used_in_tests", nil]},
      resolution_comment: {:union, [{:string, :generic}, :null]},
      resolved_at: {:union, [{:string, :date_time}, :null]},
      resolved_by: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      secret: {:string, :generic},
      secret_type: {:string, :generic},
      secret_type_display_name: {:string, :generic},
      state: {:enum, ["open", "resolved"]},
      updated_at: {:union, [{:string, :date_time}, :null]},
      url: {:string, :uri},
      validity: {:enum, ["active", "inactive", "unknown"]}
    ]
  end
end
