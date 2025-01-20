defmodule GitHubOpenAPI.SubIssuesSummary do
  @moduledoc """
  Provides struct and types for a SubIssuesSummary
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          completed: integer,
          percent_completed: integer,
          total: integer
        }

  defstruct [:__info__, :completed, :percent_completed, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [completed: :integer, percent_completed: :integer, total: :integer]
  end
end
