defmodule GitHubOpenAPI.CopilotIdeCodeCompletionsLanguages do
  @moduledoc """
  Provides struct and type for a CopilotIdeCodeCompletionsLanguages
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          name: String.t() | nil,
          total_engaged_users: integer | nil
        }

  defstruct [:__info__, :__joins__, :name, :total_engaged_users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, total_engaged_users: :integer]
  end
end
