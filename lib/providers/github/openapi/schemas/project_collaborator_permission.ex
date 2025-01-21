defmodule GitHubOpenAPI.ProjectCollaboratorPermission do
  @moduledoc """
  Provides struct and type for a ProjectCollaboratorPermission
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          permission: String.t(),
          user: GitHubOpenAPI.SimpleUser.t() | nil
        }

  defstruct [:__info__, :__joins__, :permission, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [permission: {:string, :generic}, user: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]}]
  end
end
