defmodule GitHubOpenAPI.CheckSuitePreferencePreferences do
  @moduledoc """
  Provides struct and type for a CheckSuitePreferencePreferences
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          auto_trigger_checks:
            [GitHubOpenAPI.CheckSuitePreferencePreferencesAutoTriggerChecks.t()] | nil
        }

  defstruct [:__info__, :auto_trigger_checks]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [auto_trigger_checks: [{GitHubOpenAPI.CheckSuitePreferencePreferencesAutoTriggerChecks, :t}]]
  end
end
