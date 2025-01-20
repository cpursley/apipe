defmodule GitHubOpenAPI.BranchWithProtection do
  @moduledoc """
  Provides struct and type for a BranchWithProtection
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          _links: GitHubOpenAPI.BranchWithProtectionLinks.t(),
          commit: GitHubOpenAPI.Commit.t(),
          name: String.t(),
          pattern: String.t() | nil,
          protected: boolean,
          protection: GitHubOpenAPI.BranchProtection.t(),
          protection_url: String.t(),
          required_approving_review_count: integer | nil
        }

  defstruct [
    :__info__,
    :_links,
    :commit,
    :name,
    :pattern,
    :protected,
    :protection,
    :protection_url,
    :required_approving_review_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHubOpenAPI.BranchWithProtectionLinks, :t},
      commit: {GitHubOpenAPI.Commit, :t},
      name: {:string, :generic},
      pattern: {:string, :generic},
      protected: :boolean,
      protection: {GitHubOpenAPI.BranchProtection, :t},
      protection_url: {:string, :uri},
      required_approving_review_count: :integer
    ]
  end
end
