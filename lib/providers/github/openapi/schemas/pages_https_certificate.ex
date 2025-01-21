defmodule GitHubOpenAPI.PagesHttpsCertificate do
  @moduledoc """
  Provides struct and type for a PagesHttpsCertificate
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          description: String.t(),
          domains: [String.t()],
          expires_at: Date.t() | nil,
          state: String.t()
        }

  defstruct [:__info__, :__joins__, :description, :domains, :expires_at, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      domains: [string: :generic],
      expires_at: {:string, :date},
      state:
        {:enum,
         [
           "new",
           "authorization_created",
           "authorization_pending",
           "authorized",
           "authorization_revoked",
           "issued",
           "uploaded",
           "approved",
           "errored",
           "bad_authz",
           "destroy_pending",
           "dns_changed"
         ]}
    ]
  end
end
