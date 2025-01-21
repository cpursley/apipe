defmodule GitHubOpenAPI.ActionsRepositoryPermissions do
  @moduledoc """
  Provides struct and type for a ActionsRepositoryPermissions
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          allowed_actions: String.t() | nil,
          enabled: boolean,
          selected_actions_url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :allowed_actions, :enabled, :selected_actions_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allowed_actions: {:enum, ["all", "local_only", "selected"]},
      enabled: :boolean,
      selected_actions_url: {:string, :generic}
    ]
  end
end
