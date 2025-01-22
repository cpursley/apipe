defmodule GitHubOpenAPI.CopilotSeatDetails do
  @moduledoc """
  Provides struct and type for a CopilotSeatDetails
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          assignee: GitHubOpenAPI.SimpleUser.t(),
          assigning_team: GitHubOpenAPI.EnterpriseTeam.t() | GitHubOpenAPI.Team.t() | nil,
          created_at: DateTime.t(),
          last_activity_at: DateTime.t() | nil,
          last_activity_editor: String.t() | nil,
          organization: GitHubOpenAPI.NullableOrganizationSimple.t() | nil,
          pending_cancellation_date: Date.t() | nil,
          plan_type: String.t() | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :assignee,
    :assigning_team,
    :created_at,
    :last_activity_at,
    :last_activity_editor,
    :organization,
    :pending_cancellation_date,
    :plan_type,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assignee: {GitHubOpenAPI.SimpleUser, :t},
      assigning_team: {:union, [{GitHubOpenAPI.EnterpriseTeam, :t}, {GitHubOpenAPI.Team, :t}]},
      created_at: {:string, :date_time},
      last_activity_at: {:string, :date_time},
      last_activity_editor: {:string, :generic},
      organization: {GitHubOpenAPI.NullableOrganizationSimple, :t},
      pending_cancellation_date: {:string, :date},
      plan_type: {:enum, ["business", "enterprise", "unknown"]},
      updated_at: {:string, :date_time}
    ]
  end
end
