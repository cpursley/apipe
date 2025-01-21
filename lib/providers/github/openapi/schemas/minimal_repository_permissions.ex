defmodule GitHubOpenAPI.MinimalRepositoryPermissions do
  @moduledoc """
  Provides struct and type for a MinimalRepositoryPermissions
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          admin: boolean | nil,
          maintain: boolean | nil,
          pull: boolean | nil,
          push: boolean | nil,
          triage: boolean | nil
        }

  defstruct [:__info__, :__joins__, :admin, :maintain, :pull, :push, :triage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [admin: :boolean, maintain: :boolean, pull: :boolean, push: :boolean, triage: :boolean]
  end
end
