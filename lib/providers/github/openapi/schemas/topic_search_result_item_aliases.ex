defmodule GitHubOpenAPI.TopicSearchResultItemAliases do
  @moduledoc """
  Provides struct and type for a TopicSearchResultItemAliases
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          topic_relation: GitHubOpenAPI.TopicSearchResultItemAliasesTopicRelation.t() | nil
        }

  defstruct [:__info__, :__joins__, :topic_relation]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [topic_relation: {GitHubOpenAPI.TopicSearchResultItemAliasesTopicRelation, :t}]
  end
end
