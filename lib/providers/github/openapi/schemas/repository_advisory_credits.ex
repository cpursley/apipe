defmodule GitHubOpenAPI.RepositoryAdvisoryCredits do
  @moduledoc """
  Provides struct and type for a RepositoryAdvisoryCredits
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          login: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :login, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      login: {:string, :generic},
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
         ]}
    ]
  end
end
