defmodule GitHubOpenAPI.AutoMerge do
  @moduledoc """
  Provides struct and type for a AutoMerge
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          commit_message: String.t(),
          commit_title: String.t(),
          enabled_by: GitHubOpenAPI.SimpleUser.t(),
          merge_method: String.t()
        }

  defstruct [:__info__, :__joins__, :commit_message, :commit_title, :enabled_by, :merge_method]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit_message: {:string, :generic},
      commit_title: {:string, :generic},
      enabled_by: {GitHubOpenAPI.SimpleUser, :t},
      merge_method: {:enum, ["merge", "squash", "rebase"]}
    ]
  end
end
