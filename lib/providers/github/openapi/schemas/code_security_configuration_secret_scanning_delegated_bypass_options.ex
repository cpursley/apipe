defmodule GitHubOpenAPI.CodeSecurityConfigurationSecretScanningDelegatedBypassOptions do
  @moduledoc """
  Provides struct and type for a CodeSecurityConfigurationSecretScanningDelegatedBypassOptions
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          reviewers:
            [
              GitHubOpenAPI.CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewers.t()
            ]
            | nil
        }

  defstruct [:__info__, :reviewers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      reviewers: [
        {GitHubOpenAPI.CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewers, :t}
      ]
    ]
  end
end
