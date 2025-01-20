defmodule GitHubOpenAPI.CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewers do
  @moduledoc """
  Provides struct and type for a CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewers
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, reviewer_id: integer, reviewer_type: String.t()}

  defstruct [:__info__, :reviewer_id, :reviewer_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [reviewer_id: :integer, reviewer_type: {:enum, ["TEAM", "ROLE"]}]
  end
end
