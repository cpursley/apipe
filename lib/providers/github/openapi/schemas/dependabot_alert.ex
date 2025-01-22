defmodule GitHubOpenAPI.DependabotAlert do
  @moduledoc """
  Provides struct and type for a DependabotAlert
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          auto_dismissed_at: DateTime.t() | nil,
          created_at: DateTime.t(),
          dependency: GitHubOpenAPI.DependabotAlertDependency.t(),
          dismissed_at: DateTime.t(),
          dismissed_by: GitHubOpenAPI.NullableSimpleUser.t(),
          dismissed_comment: String.t() | nil,
          dismissed_reason: String.t() | nil,
          fixed_at: DateTime.t(),
          html_url: String.t(),
          number: integer,
          security_advisory: GitHubOpenAPI.DependabotAlertSecurityAdvisory.t(),
          security_vulnerability: GitHubOpenAPI.DependabotAlertSecurityVulnerability.t(),
          state: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :auto_dismissed_at,
    :created_at,
    :dependency,
    :dismissed_at,
    :dismissed_by,
    :dismissed_comment,
    :dismissed_reason,
    :fixed_at,
    :html_url,
    :number,
    :security_advisory,
    :security_vulnerability,
    :state,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      auto_dismissed_at: {:string, :date_time},
      created_at: {:string, :date_time},
      dependency: {GitHubOpenAPI.DependabotAlertDependency, :t},
      dismissed_at: {:string, :date_time},
      dismissed_by: {GitHubOpenAPI.NullableSimpleUser, :t},
      dismissed_comment: {:string, :generic},
      dismissed_reason:
        {:enum, ["fix_started", "inaccurate", "no_bandwidth", "not_used", "tolerable_risk"]},
      fixed_at: {:string, :date_time},
      html_url: {:string, :uri},
      number: :integer,
      security_advisory: {GitHubOpenAPI.DependabotAlertSecurityAdvisory, :t},
      security_vulnerability: {GitHubOpenAPI.DependabotAlertSecurityVulnerability, :t},
      state: {:enum, ["auto_dismissed", "dismissed", "fixed", "open"]},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
