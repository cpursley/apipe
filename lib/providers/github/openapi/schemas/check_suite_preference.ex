defmodule GitHubOpenAPI.CheckSuitePreference do
  @moduledoc """
  Provides struct and type for a CheckSuitePreference
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          preferences: GitHubOpenAPI.CheckSuitePreferencePreferences.t(),
          repository: GitHubOpenAPI.MinimalRepository.t()
        }

  defstruct [:__info__, :__joins__, :preferences, :repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      preferences: {GitHubOpenAPI.CheckSuitePreferencePreferences, :t},
      repository: {GitHubOpenAPI.MinimalRepository, :t}
    ]
  end
end
