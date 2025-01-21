defmodule GitHubOpenAPI.SocialAccount do
  @moduledoc """
  Provides struct and type for a SocialAccount
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, provider: String.t(), url: String.t()}

  defstruct [:__info__, :__joins__, :provider, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [provider: {:string, :generic}, url: {:string, :generic}]
  end
end
