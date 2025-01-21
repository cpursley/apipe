defmodule GitHubOpenAPI.RepositoryRulesetLinks do
  @moduledoc """
  Provides struct and type for a RepositoryRulesetLinks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          html: GitHubOpenAPI.RepositoryRulesetLinksHtml.t() | nil,
          self: GitHubOpenAPI.RepositoryRulesetLinksSelf.t() | nil
        }

  defstruct [:__info__, :__joins__, :html, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html: {:union, [{GitHubOpenAPI.RepositoryRulesetLinksHtml, :t}, :null]},
      self: {GitHubOpenAPI.RepositoryRulesetLinksSelf, :t}
    ]
  end
end
