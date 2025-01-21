defmodule GitHubOpenAPI.Tag do
  @moduledoc """
  Provides struct and type for a Tag
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          commit: GitHubOpenAPI.TagCommit.t(),
          name: String.t(),
          node_id: String.t(),
          tarball_url: String.t(),
          zipball_url: String.t()
        }

  defstruct [:__info__, :__joins__, :commit, :name, :node_id, :tarball_url, :zipball_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit: {GitHubOpenAPI.TagCommit, :t},
      name: {:string, :generic},
      node_id: {:string, :generic},
      tarball_url: {:string, :uri},
      zipball_url: {:string, :uri}
    ]
  end
end
