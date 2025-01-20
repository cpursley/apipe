defmodule GitHubOpenAPI.CodeSecurityConfiguration do
  @moduledoc """
  Provides struct and type for a CodeSecurityConfiguration
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          advanced_security: String.t() | nil,
          code_scanning_default_setup: String.t() | nil,
          code_scanning_default_setup_options:
            GitHubOpenAPI.CodeSecurityConfigurationCodeScanningDefaultSetupOptions.t() | nil,
          created_at: DateTime.t() | nil,
          dependabot_alerts: String.t() | nil,
          dependabot_security_updates: String.t() | nil,
          dependency_graph: String.t() | nil,
          dependency_graph_autosubmit_action: String.t() | nil,
          dependency_graph_autosubmit_action_options:
            GitHubOpenAPI.CodeSecurityConfigurationDependencyGraphAutosubmitActionOptions.t()
            | nil,
          description: String.t() | nil,
          enforcement: String.t() | nil,
          html_url: String.t() | nil,
          id: integer | nil,
          name: String.t() | nil,
          private_vulnerability_reporting: String.t() | nil,
          secret_scanning: String.t() | nil,
          secret_scanning_delegated_bypass: String.t() | nil,
          secret_scanning_delegated_bypass_options:
            GitHubOpenAPI.CodeSecurityConfigurationSecretScanningDelegatedBypassOptions.t() | nil,
          secret_scanning_non_provider_patterns: String.t() | nil,
          secret_scanning_push_protection: String.t() | nil,
          secret_scanning_validity_checks: String.t() | nil,
          target_type: String.t() | nil,
          updated_at: DateTime.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :advanced_security,
    :code_scanning_default_setup,
    :code_scanning_default_setup_options,
    :created_at,
    :dependabot_alerts,
    :dependabot_security_updates,
    :dependency_graph,
    :dependency_graph_autosubmit_action,
    :dependency_graph_autosubmit_action_options,
    :description,
    :enforcement,
    :html_url,
    :id,
    :name,
    :private_vulnerability_reporting,
    :secret_scanning,
    :secret_scanning_delegated_bypass,
    :secret_scanning_delegated_bypass_options,
    :secret_scanning_non_provider_patterns,
    :secret_scanning_push_protection,
    :secret_scanning_validity_checks,
    :target_type,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      advanced_security: {:enum, ["enabled", "disabled"]},
      code_scanning_default_setup: {:enum, ["enabled", "disabled", "not_set"]},
      code_scanning_default_setup_options:
        {:union,
         [{GitHubOpenAPI.CodeSecurityConfigurationCodeScanningDefaultSetupOptions, :t}, :null]},
      created_at: {:string, :date_time},
      dependabot_alerts: {:enum, ["enabled", "disabled", "not_set"]},
      dependabot_security_updates: {:enum, ["enabled", "disabled", "not_set"]},
      dependency_graph: {:enum, ["enabled", "disabled", "not_set"]},
      dependency_graph_autosubmit_action: {:enum, ["enabled", "disabled", "not_set"]},
      dependency_graph_autosubmit_action_options:
        {GitHubOpenAPI.CodeSecurityConfigurationDependencyGraphAutosubmitActionOptions, :t},
      description: {:string, :generic},
      enforcement: {:enum, ["enforced", "unenforced"]},
      html_url: {:string, :uri},
      id: :integer,
      name: {:string, :generic},
      private_vulnerability_reporting: {:enum, ["enabled", "disabled", "not_set"]},
      secret_scanning: {:enum, ["enabled", "disabled", "not_set"]},
      secret_scanning_delegated_bypass: {:enum, ["enabled", "disabled", "not_set"]},
      secret_scanning_delegated_bypass_options:
        {GitHubOpenAPI.CodeSecurityConfigurationSecretScanningDelegatedBypassOptions, :t},
      secret_scanning_non_provider_patterns: {:enum, ["enabled", "disabled", "not_set"]},
      secret_scanning_push_protection: {:enum, ["enabled", "disabled", "not_set"]},
      secret_scanning_validity_checks: {:enum, ["enabled", "disabled", "not_set"]},
      target_type: {:enum, ["global", "organization", "enterprise"]},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
