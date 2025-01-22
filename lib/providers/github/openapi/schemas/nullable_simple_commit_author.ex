defmodule GitHubOpenAPI.NullableSimpleCommitAuthor do
  @moduledoc """
  Provides struct and type for a NullableSimpleCommitAuthor
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, email: String.t(), name: String.t()}

  defstruct [:__info__, :__joins__, :email, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {:string, :email}, name: {:string, :generic}]
  end
end
