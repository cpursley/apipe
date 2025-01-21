defmodule GitHubOpenAPI.RepositoryRulesetLinksHtml do
  @moduledoc """
  Provides struct and type for a RepositoryRulesetLinksHtml
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, href: String.t() | nil}

  defstruct [:__info__, :__joins__, :href]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [href: {:string, :generic}]
  end
end
