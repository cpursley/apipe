defmodule GitHubOpenAPI.Page do
  @moduledoc """
  Provides struct and type for a Page
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          build_type: String.t() | nil,
          cname: String.t() | nil,
          custom_404: boolean,
          html_url: String.t() | nil,
          https_certificate: GitHubOpenAPI.PagesHttpsCertificate.t() | nil,
          https_enforced: boolean | nil,
          pending_domain_unverified_at: DateTime.t() | nil,
          protected_domain_state: String.t() | nil,
          public: boolean,
          source: GitHubOpenAPI.PagesSourceHash.t() | nil,
          status: String.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :build_type,
    :cname,
    :custom_404,
    :html_url,
    :https_certificate,
    :https_enforced,
    :pending_domain_unverified_at,
    :protected_domain_state,
    :public,
    :source,
    :status,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      build_type: {:enum, ["legacy", "workflow"]},
      cname: {:string, :generic},
      custom_404: :boolean,
      html_url: {:string, :uri},
      https_certificate: {GitHubOpenAPI.PagesHttpsCertificate, :t},
      https_enforced: :boolean,
      pending_domain_unverified_at: {:string, :date_time},
      protected_domain_state: {:enum, ["pending", "verified", "unverified"]},
      public: :boolean,
      source: {GitHubOpenAPI.PagesSourceHash, :t},
      status: {:enum, ["built", "building", "errored"]},
      url: {:string, :uri}
    ]
  end
end
