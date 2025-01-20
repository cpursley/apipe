defmodule GitHubOpenAPI.ActionsRunnerLabels do
  @moduledoc """
  Provides struct and type for a ActionsRunnerLabels
  """
  use Apipe.Providers.OpenAPIEncoder

  @type json_resp :: %__MODULE__{
          __info__: map,
          labels: [GitHubOpenAPI.RunnerLabel.t()],
          total_count: integer
        }

  defstruct [:__info__, :labels, :total_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [labels: [{GitHubOpenAPI.RunnerLabel, :t}], total_count: :integer]
  end
end
