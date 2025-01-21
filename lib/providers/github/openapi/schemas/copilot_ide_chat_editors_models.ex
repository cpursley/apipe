defmodule GitHubOpenAPI.CopilotIdeChatEditorsModels do
  @moduledoc """
  Provides struct and type for a CopilotIdeChatEditorsModels
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          custom_model_training_date: String.t() | nil,
          is_custom_model: boolean | nil,
          name: String.t() | nil,
          total_chat_copy_events: integer | nil,
          total_chat_insertion_events: integer | nil,
          total_chats: integer | nil,
          total_engaged_users: integer | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :custom_model_training_date,
    :is_custom_model,
    :name,
    :total_chat_copy_events,
    :total_chat_insertion_events,
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
      total_chat_copy_events: :integer,
      total_chat_insertion_events: :integer,
      total_chats: :integer,
      total_engaged_users: :integer
    ]
  end
end
