defmodule GitHubOpenAPI.BranchShort do
  @moduledoc """
  Provides struct and type for a BranchShort
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          commit: GitHubOpenAPI.BranchShortCommit.t(),
          name: String.t(),
          protected: boolean
        }

  defstruct [:__info__, :__joins__, :commit, :name, :protected]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit: {GitHubOpenAPI.BranchShortCommit, :t},
      name: {:string, :generic},
      protected: :boolean
    ]
  end
end
