defmodule GitHubOpenAPI.SecretScanningLocationPullRequestTitle do
  @moduledoc """
  Provides struct and type for a SecretScanningLocationPullRequestTitle
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, pull_request_title_url: String.t()}

  defstruct [:__info__, :__joins__, :pull_request_title_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [pull_request_title_url: {:string, :uri}]
  end
end
