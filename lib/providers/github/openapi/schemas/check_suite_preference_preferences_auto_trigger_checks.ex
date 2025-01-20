defmodule GitHubOpenAPI.CheckSuitePreferencePreferencesAutoTriggerChecks do
  @moduledoc """
  Provides struct and type for a CheckSuitePreferencePreferencesAutoTriggerChecks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, app_id: integer, setting: boolean}

  defstruct [:__info__, :app_id, :setting]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [app_id: :integer, setting: :boolean]
  end
end
