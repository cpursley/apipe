defmodule GitHubOpenAPI.Runner do
  @moduledoc """
  Provides struct and type for a Runner
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          busy: boolean,
          id: integer,
          labels: [GitHubOpenAPI.RunnerLabel.t()],
          name: String.t(),
          os: String.t(),
          runner_group_id: integer | nil,
          status: String.t()
        }

  defstruct [:__info__, :busy, :id, :labels, :name, :os, :runner_group_id, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      busy: :boolean,
      id: :integer,
      labels: [{GitHubOpenAPI.RunnerLabel, :t}],
      name: {:string, :generic},
      os: {:string, :generic},
      runner_group_id: :integer,
      status: {:string, :generic}
    ]
  end
end
