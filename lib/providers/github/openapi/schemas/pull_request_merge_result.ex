defmodule GitHubOpenAPI.PullRequestMergeResult do
  @moduledoc """
  Provides struct and type for a PullRequestMergeResult
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          merged: boolean,
          message: String.t(),
          sha: String.t()
        }

  defstruct [:__info__, :__joins__, :merged, :message, :sha]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [merged: :boolean, message: {:string, :generic}, sha: {:string, :generic}]
  end
end
