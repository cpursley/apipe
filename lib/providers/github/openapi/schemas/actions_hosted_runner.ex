defmodule GitHubOpenAPI.ActionsHostedRunner do
  @moduledoc """
  Provides struct and type for a ActionsHostedRunner
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: integer,
          image_details: GitHubOpenAPI.NullableActionsHostedRunnerPoolImage.t(),
          last_active_on: DateTime.t() | nil,
          machine_size_details: GitHubOpenAPI.ActionsHostedRunnerMachineSpec.t(),
          maximum_runners: integer | nil,
          name: String.t(),
          platform: String.t(),
          public_ip_enabled: boolean,
          public_ips: [GitHubOpenAPI.PublicIp.t()] | nil,
          runner_group_id: integer | nil,
          status: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :id,
    :image_details,
    :last_active_on,
    :machine_size_details,
    :maximum_runners,
    :name,
    :platform,
    :public_ip_enabled,
    :public_ips,
    :runner_group_id,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :integer,
      image_details: {GitHubOpenAPI.NullableActionsHostedRunnerPoolImage, :t},
      last_active_on: {:string, :date_time},
      machine_size_details: {GitHubOpenAPI.ActionsHostedRunnerMachineSpec, :t},
      maximum_runners: :integer,
      name: {:string, :generic},
      platform: {:string, :generic},
      public_ip_enabled: :boolean,
      public_ips: [{GitHubOpenAPI.PublicIp, :t}],
      runner_group_id: :integer,
      status: {:enum, ["Ready", "Provisioning", "Shutdown", "Deleting", "Stuck"]}
    ]
  end
end
