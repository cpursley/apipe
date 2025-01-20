defmodule GitHubOpenAPI.CopilotIdeCodeCompletions do
  @moduledoc """
  Provides struct and type for a CopilotIdeCodeCompletions
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          editors: [GitHubOpenAPI.CopilotIdeCodeCompletionsEditors.t()] | nil,
          languages: [GitHubOpenAPI.CopilotIdeCodeCompletionsLanguages.t()] | nil,
          total_engaged_users: integer | nil
        }

  defstruct [:__info__, :editors, :languages, :total_engaged_users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      editors: [{GitHubOpenAPI.CopilotIdeCodeCompletionsEditors, :t}],
      languages: [{GitHubOpenAPI.CopilotIdeCodeCompletionsLanguages, :t}],
      total_engaged_users: :integer
    ]
  end
end
