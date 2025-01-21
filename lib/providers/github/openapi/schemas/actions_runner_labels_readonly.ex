defmodule GitHubOpenAPI.ActionsRunnerLabelsReadonly do
  @moduledoc """
  Provides struct and type for a ActionsRunnerLabelsReadonly
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type json_resp :: %__MODULE__{
          __info__: map,
          __joins__: map,
          labels: [GitHubOpenAPI.RunnerLabel.t()],
          total_count: integer
        }

  defstruct [:__info__, :__joins__, :labels, :total_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [labels: [{GitHubOpenAPI.RunnerLabel, :t}], total_count: :integer]
  end
end
