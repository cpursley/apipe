defmodule GitHubOpenAPI.ReviewCustomGatesCommentRequired do
  @moduledoc """
  Provides struct and type for a ReviewCustomGatesCommentRequired
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, comment: String.t(), environment_name: String.t()}

  defstruct [:__info__, :comment, :environment_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [comment: {:string, :generic}, environment_name: {:string, :generic}]
  end
end
