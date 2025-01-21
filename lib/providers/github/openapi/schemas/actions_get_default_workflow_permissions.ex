defmodule GitHubOpenAPI.ActionsGetDefaultWorkflowPermissions do
  @moduledoc """
  Provides struct and type for a ActionsGetDefaultWorkflowPermissions
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          can_approve_pull_request_reviews: boolean,
          default_workflow_permissions: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :can_approve_pull_request_reviews,
    :default_workflow_permissions
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      can_approve_pull_request_reviews: :boolean,
      default_workflow_permissions: {:enum, ["read", "write"]}
    ]
  end
end
