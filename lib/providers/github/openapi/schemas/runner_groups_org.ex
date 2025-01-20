defmodule GitHubOpenAPI.RunnerGroupsOrg do
  @moduledoc """
  Provides struct and type for a RunnerGroupsOrg
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          allows_public_repositories: boolean,
          default: boolean,
          hosted_runners_url: String.t() | nil,
          id: number,
          inherited: boolean,
          inherited_allows_public_repositories: boolean | nil,
          name: String.t(),
          network_configuration_id: String.t() | nil,
          restricted_to_workflows: boolean | nil,
          runners_url: String.t(),
          selected_repositories_url: String.t() | nil,
          selected_workflows: [String.t()] | nil,
          visibility: String.t(),
          workflow_restrictions_read_only: boolean | nil
        }

  defstruct [
    :__info__,
    :allows_public_repositories,
    :default,
    :hosted_runners_url,
    :id,
    :inherited,
    :inherited_allows_public_repositories,
    :name,
    :network_configuration_id,
    :restricted_to_workflows,
    :runners_url,
    :selected_repositories_url,
    :selected_workflows,
    :visibility,
    :workflow_restrictions_read_only
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allows_public_repositories: :boolean,
      default: :boolean,
      hosted_runners_url: {:string, :generic},
      id: :number,
      inherited: :boolean,
      inherited_allows_public_repositories: :boolean,
      name: {:string, :generic},
      network_configuration_id: {:string, :generic},
      restricted_to_workflows: :boolean,
      runners_url: {:string, :generic},
      selected_repositories_url: {:string, :generic},
      selected_workflows: [string: :generic],
      visibility: {:string, :generic},
      workflow_restrictions_read_only: :boolean
    ]
  end
end
