defmodule GitHubOpenAPI.GlobalAdvisoryCredits do
  @moduledoc """
  Provides struct and type for a GlobalAdvisoryCredits
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          type: String.t(),
          user: GitHubOpenAPI.SimpleUser.t()
        }

  defstruct [:__info__, :__joins__, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      type:
        {:enum,
         [
           "analyst",
           "finder",
           "reporter",
           "coordinator",
           "remediation_developer",
           "remediation_reviewer",
           "remediation_verifier",
           "tool",
           "sponsor",
           "other"
         ]},
      user: {GitHubOpenAPI.SimpleUser, :t}
    ]
  end
end
