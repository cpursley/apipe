defmodule GitHubOpenAPI.PendingDeployment do
  @moduledoc """
  Provides struct and type for a PendingDeployment
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          current_user_can_approve: boolean,
          environment: GitHubOpenAPI.PendingDeploymentEnvironment.t(),
          reviewers: [GitHubOpenAPI.PendingDeploymentReviewers.t()],
          wait_timer: integer,
          wait_timer_started_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :current_user_can_approve,
    :environment,
    :reviewers,
    :wait_timer,
    :wait_timer_started_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      current_user_can_approve: :boolean,
      environment: {GitHubOpenAPI.PendingDeploymentEnvironment, :t},
      reviewers: [{GitHubOpenAPI.PendingDeploymentReviewers, :t}],
      wait_timer: :integer,
      wait_timer_started_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
