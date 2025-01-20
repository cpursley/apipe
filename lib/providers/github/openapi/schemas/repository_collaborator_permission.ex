defmodule GitHubOpenAPI.RepositoryCollaboratorPermission do
  @moduledoc """
  Provides struct and type for a RepositoryCollaboratorPermission
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          permission: String.t(),
          role_name: String.t(),
          user: GitHubOpenAPI.Collaborator.t() | nil
        }

  defstruct [:__info__, :permission, :role_name, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      permission: {:string, :generic},
      role_name: {:string, :generic},
      user: {:union, [{GitHubOpenAPI.Collaborator, :t}, :null]}
    ]
  end
end
