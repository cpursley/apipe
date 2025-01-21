defmodule GitHubOpenAPI.CopilotIdeChat do
  @moduledoc """
  Provides struct and type for a CopilotIdeChat
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          editors: [GitHubOpenAPI.CopilotIdeChatEditors.t()] | nil,
          total_engaged_users: integer | nil
        }

  defstruct [:__info__, :__joins__, :editors, :total_engaged_users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [editors: [{GitHubOpenAPI.CopilotIdeChatEditors, :t}], total_engaged_users: :integer]
  end
end
