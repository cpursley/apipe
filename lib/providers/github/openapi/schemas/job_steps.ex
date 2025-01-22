defmodule GitHubOpenAPI.JobSteps do
  @moduledoc """
  Provides struct and type for a JobSteps
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          completed_at: DateTime.t() | nil,
          conclusion: String.t() | nil,
          name: String.t(),
          number: integer,
          started_at: DateTime.t() | nil,
          status: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :completed_at,
    :conclusion,
    :name,
    :number,
    :started_at,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completed_at: {:string, :date_time},
      conclusion: {:string, :generic},
      name: {:string, :generic},
      number: :integer,
      started_at: {:string, :date_time},
      status: {:enum, ["queued", "in_progress", "completed"]}
    ]
  end
end
