defmodule GitHubOpenAPI.CopilotIdeCodeCompletionsEditorsModelsLanguages do
  @moduledoc """
  Provides struct and type for a CopilotIdeCodeCompletionsEditorsModelsLanguages
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          name: String.t() | nil,
          total_code_acceptances: integer | nil,
          total_code_lines_accepted: integer | nil,
          total_code_lines_suggested: integer | nil,
          total_code_suggestions: integer | nil,
          total_engaged_users: integer | nil
        }

  defstruct [
    :__info__,
    :name,
    :total_code_acceptances,
    :total_code_lines_accepted,
    :total_code_lines_suggested,
    :total_code_suggestions,
    :total_engaged_users
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: {:string, :generic},
      total_code_acceptances: :integer,
      total_code_lines_accepted: :integer,
      total_code_lines_suggested: :integer,
      total_code_suggestions: :integer,
      total_engaged_users: :integer
    ]
  end
end
