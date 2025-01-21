defmodule GitHubOpenAPI.RepositoryPermissions do
  @moduledoc """
  Provides struct and type for a RepositoryPermissions
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          admin: boolean,
          maintain: boolean | nil,
          pull: boolean,
          push: boolean,
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
