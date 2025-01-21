defmodule GitHubOpenAPI.CopilotIdeChatEditors do
  @moduledoc """
  Provides struct and type for a CopilotIdeChatEditors
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          models: [GitHubOpenAPI.CopilotIdeChatEditorsModels.t()] | nil,
          name: String.t() | nil,
          total_engaged_users: integer | nil
        }

  defstruct [:__info__, :__joins__, :models, :name, :total_engaged_users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      models: [{GitHubOpenAPI.CopilotIdeChatEditorsModels, :t}],
      name: {:string, :generic},
      total_engaged_users: :integer
    ]
  end
end
