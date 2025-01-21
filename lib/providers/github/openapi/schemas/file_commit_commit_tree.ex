defmodule GitHubOpenAPI.FileCommitCommitTree do
  @moduledoc """
  Provides struct and type for a FileCommitCommitTree
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          sha: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :sha, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [sha: {:string, :generic}, url: {:string, :generic}]
  end
end
