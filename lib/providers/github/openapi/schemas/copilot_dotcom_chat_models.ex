defmodule GitHubOpenAPI.CopilotDotcomChatModels do
  @moduledoc """
  Provides struct and type for a CopilotDotcomChatModels
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          custom_model_training_date: String.t() | nil,
          is_custom_model: boolean | nil,
          name: String.t() | nil,
          total_chats: integer | nil,
          total_engaged_users: integer | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :custom_model_training_date,
    :is_custom_model,
    :name,
    :total_chats,
    :total_engaged_users
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_model_training_date: {:union, [{:string, :generic}, :null]},
      is_custom_model: :boolean,
      name: {:string, :generic},
      total_chats: :integer,
      total_engaged_users: :integer
    ]
  end
end
