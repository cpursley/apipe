defmodule GitHubOpenAPI.CopilotIdeCodeCompletionsEditors do
  @moduledoc """
  Provides struct and type for a CopilotIdeCodeCompletionsEditors
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          models: [GitHubOpenAPI.CopilotIdeCodeCompletionsEditorsModels.t()] | nil,
          name: String.t() | nil,
          total_engaged_users: integer | nil
        }

  defstruct [:__info__, :models, :name, :total_engaged_users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      models: [{GitHubOpenAPI.CopilotIdeCodeCompletionsEditorsModels, :t}],
      name: {:string, :generic},
      total_engaged_users: :integer
    ]
  end
end
