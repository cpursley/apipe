defmodule GitHubOpenAPI.SecretScanningLocationPullRequestReview do
  @moduledoc """
  Provides struct and type for a SecretScanningLocationPullRequestReview
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, pull_request_review_url: String.t()}

  defstruct [:__info__, :pull_request_review_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [pull_request_review_url: {:string, :uri}]
  end
end
