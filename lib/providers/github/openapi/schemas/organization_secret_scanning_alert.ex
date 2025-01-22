defmodule GitHubOpenAPI.OrganizationSecretScanningAlert do
  @moduledoc """
  Provides struct and type for a OrganizationSecretScanningAlert
  """
  use Apipe.Providers.OpenAPI.Encoder

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
          push_protection_bypass_request_reviewer: GitHubOpenAPI.NullableSimpleUser.t() | nil,
          push_protection_bypass_request_reviewer_comment: String.t() | nil,
          push_protection_bypassed: boolean | nil,
          push_protection_bypassed_at: DateTime.t() | nil,
          push_protection_bypassed_by: GitHubOpenAPI.NullableSimpleUser.t() | nil,
          repository: GitHubOpenAPI.SimpleRepository.t() | nil,
          resolution: String.t() | nil,
          resolution_comment: String.t() | nil,
          resolved_at: DateTime.t() | nil,
          resolved_by: GitHubOpenAPI.NullableSimpleUser.t() | nil,
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
    :repository,
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
      multi_repo: :boolean,
      number: :integer,
      publicly_leaked: :boolean,
      push_protection_bypass_request_comment: {:string, :generic},
      push_protection_bypass_request_html_url: {:string, :uri},
      push_protection_bypass_request_reviewer: {GitHubOpenAPI.NullableSimpleUser, :t},
      push_protection_bypass_request_reviewer_comment: {:string, :generic},
      push_protection_bypassed: :boolean,
      push_protection_bypassed_at: {:string, :date_time},
      push_protection_bypassed_by: {GitHubOpenAPI.NullableSimpleUser, :t},
      repository: {GitHubOpenAPI.SimpleRepository, :t},
      resolution: {:enum, ["false_positive", "wont_fix", "revoked", "used_in_tests"]},
      resolution_comment: {:string, :generic},
      resolved_at: {:string, :date_time},
      resolved_by: {GitHubOpenAPI.NullableSimpleUser, :t},
      secret: {:string, :generic},
      secret_type: {:string, :generic},
      secret_type_display_name: {:string, :generic},
      state: {:enum, ["open", "resolved"]},
      updated_at: {:string, :date_time},
      url: {:string, :uri},
      validity: {:enum, ["active", "inactive", "unknown"]}
    ]
  end
end
