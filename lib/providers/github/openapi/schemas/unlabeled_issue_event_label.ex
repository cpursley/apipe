defmodule GitHubOpenAPI.UnlabeledIssueEventLabel do
  @moduledoc """
  Provides struct and type for a UnlabeledIssueEventLabel
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, color: String.t(), name: String.t()}

  defstruct [:__info__, :__joins__, :color, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [color: {:string, :generic}, name: {:string, :generic}]
  end
end
