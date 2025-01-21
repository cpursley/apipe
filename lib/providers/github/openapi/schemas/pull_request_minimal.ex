defmodule GitHubOpenAPI.PullRequestMinimal do
  @moduledoc """
  Provides struct and type for a PullRequestMinimal
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          base: GitHubOpenAPI.PullRequestMinimalBase.t(),
          head: GitHubOpenAPI.PullRequestMinimalHead.t(),
          id: integer,
          number: integer,
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :base, :head, :id, :number, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      base: {GitHubOpenAPI.PullRequestMinimalBase, :t},
      head: {GitHubOpenAPI.PullRequestMinimalHead, :t},
      id: :integer,
      number: :integer,
      url: {:string, :generic}
    ]
  end
end
