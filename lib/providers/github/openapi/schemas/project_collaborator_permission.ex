defmodule GitHubOpenAPI.ProjectCollaboratorPermission do
  @moduledoc """
  Provides struct and type for a ProjectCollaboratorPermission
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          permission: String.t(),
          user: GitHubOpenAPI.NullableSimpleUser.t()
        }

  defstruct [:__info__, :__joins__, :permission, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [permission: {:string, :generic}, user: {GitHubOpenAPI.NullableSimpleUser, :t}]
  end
end
