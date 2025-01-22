defmodule GitHubOpenAPI.TopicSearchResultItemRelated do
  @moduledoc """
  Provides struct and type for a TopicSearchResultItemRelated
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          topic_relation: GitHubOpenAPI.TopicSearchResultItemRelatedTopicRelation.t() | nil
        }

  defstruct [:__info__, :__joins__, :topic_relation]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [topic_relation: {GitHubOpenAPI.TopicSearchResultItemRelatedTopicRelation, :t}]
  end
end
