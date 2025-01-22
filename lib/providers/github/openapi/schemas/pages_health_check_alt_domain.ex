defmodule GitHubOpenAPI.PagesHealthCheckAltDomain do
  @moduledoc """
  Provides struct and type for a PagesHealthCheckAltDomain
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          caa_error: String.t() | nil,
          dns_resolves: boolean | nil,
          enforces_https: boolean | nil,
          has_cname_record: boolean | nil,
          has_mx_records_present: boolean | nil,
          host: String.t() | nil,
          https_error: String.t() | nil,
          is_a_record: boolean | nil,
          is_apex_domain: boolean | nil,
          is_cloudflare_ip: boolean | nil,
          is_cname_to_fastly: boolean | nil,
          is_cname_to_github_user_domain: boolean | nil,
          is_cname_to_pages_dot_github_dot_com: boolean | nil,
          is_fastly_ip: boolean | nil,
          is_https_eligible: boolean | nil,
          is_non_github_pages_ip_present: boolean | nil,
          is_old_ip_address: boolean | nil,
          is_pages_domain: boolean | nil,
          is_pointed_to_github_pages_ip: boolean | nil,
          is_proxied: boolean | nil,
          is_served_by_pages: boolean | nil,
          is_valid: boolean | nil,
          is_valid_domain: boolean | nil,
          nameservers: String.t() | nil,
          reason: String.t() | nil,
          responds_to_https: boolean | nil,
          should_be_a_record: boolean | nil,
          uri: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :caa_error,
    :dns_resolves,
    :enforces_https,
    :has_cname_record,
    :has_mx_records_present,
    :host,
    :https_error,
    :is_a_record,
    :is_apex_domain,
    :is_cloudflare_ip,
    :is_cname_to_fastly,
    :is_cname_to_github_user_domain,
    :is_cname_to_pages_dot_github_dot_com,
    :is_fastly_ip,
    :is_https_eligible,
    :is_non_github_pages_ip_present,
    :is_old_ip_address,
    :is_pages_domain,
    :is_pointed_to_github_pages_ip,
    :is_proxied,
    :is_served_by_pages,
    :is_valid,
    :is_valid_domain,
    :nameservers,
    :reason,
    :responds_to_https,
    :should_be_a_record,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      caa_error: {:string, :generic},
      dns_resolves: :boolean,
      enforces_https: :boolean,
      has_cname_record: :boolean,
      has_mx_records_present: :boolean,
      host: {:string, :generic},
      https_error: {:string, :generic},
      is_a_record: :boolean,
      is_apex_domain: :boolean,
      is_cloudflare_ip: :boolean,
      is_cname_to_fastly: :boolean,
      is_cname_to_github_user_domain: :boolean,
      is_cname_to_pages_dot_github_dot_com: :boolean,
      is_fastly_ip: :boolean,
      is_https_eligible: :boolean,
      is_non_github_pages_ip_present: :boolean,
      is_old_ip_address: :boolean,
      is_pages_domain: :boolean,
      is_pointed_to_github_pages_ip: :boolean,
      is_proxied: :boolean,
      is_served_by_pages: :boolean,
      is_valid: :boolean,
      is_valid_domain: :boolean,
      nameservers: {:string, :generic},
      reason: {:string, :generic},
      responds_to_https: :boolean,
      should_be_a_record: :boolean,
      uri: {:string, :generic}
    ]
  end
end
