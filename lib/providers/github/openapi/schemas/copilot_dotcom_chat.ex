defmodule GitHubOpenAPI.CopilotDotcomChat do
  @moduledoc """
  Provides struct and type for a CopilotDotcomChat
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          models: [GitHubOpenAPI.CopilotDotcomChatModels.t()] | nil,
          total_engaged_users: integer | nil
        }

  defstruct [:__info__, :models, :total_engaged_users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [models: [{GitHubOpenAPI.CopilotDotcomChatModels, :t}], total_engaged_users: :integer]
  end
end
