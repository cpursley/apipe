defmodule GitHubOpenAPI.TopicSearchResultItemAliasesTopicRelation do
  @moduledoc """
  Provides struct and type for a TopicSearchResultItemAliasesTopicRelation
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: integer | nil,
          name: String.t() | nil,
          relation_type: String.t() | nil,
          topic_id: integer | nil
        }

  defstruct [:__info__, :__joins__, :id, :name, :relation_type, :topic_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :integer,
      name: {:string, :generic},
      relation_type: {:string, :generic},
      topic_id: :integer
    ]
  end
end
