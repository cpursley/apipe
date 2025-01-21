defmodule GitHubOpenAPI.DemilestonedIssueEventMilestone do
  @moduledoc """
  Provides struct and type for a DemilestonedIssueEventMilestone
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, title: String.t()}

  defstruct [:__info__, :__joins__, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [title: {:string, :generic}]
  end
end
