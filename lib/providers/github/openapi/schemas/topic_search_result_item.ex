defmodule GitHubOpenAPI.TopicSearchResultItem do
  @moduledoc """
  Provides struct and type for a TopicSearchResultItem
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          aliases: [map] | nil,
          created_at: DateTime.t(),
          created_by: String.t() | nil,
          curated: boolean,
          description: String.t() | nil,
          display_name: String.t() | nil,
          featured: boolean,
          logo_url: String.t() | nil,
          name: String.t(),
          related: [map] | nil,
          released: String.t() | nil,
          repository_count: integer | nil,
          score: number,
          short_description: String.t() | nil,
          text_matches: [GitHubOpenAPI.SearchResultTextMatches.t()] | nil,
          updated_at: DateTime.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :aliases,
    :created_at,
    :created_by,
    :curated,
    :description,
    :display_name,
    :featured,
    :logo_url,
    :name,
    :related,
    :released,
    :repository_count,
    :score,
    :short_description,
    :text_matches,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aliases: {:union, [[:map], :null]},
      created_at: {:string, :date_time},
      created_by: {:union, [{:string, :generic}, :null]},
      curated: :boolean,
      description: {:union, [{:string, :generic}, :null]},
      display_name: {:union, [{:string, :generic}, :null]},
      featured: :boolean,
      logo_url: {:union, [{:string, :uri}, :null]},
      name: {:string, :generic},
      related: {:union, [[:map], :null]},
      released: {:union, [{:string, :generic}, :null]},
      repository_count: {:union, [:integer, :null]},
      score: :number,
      short_description: {:union, [{:string, :generic}, :null]},
      text_matches: [{GitHubOpenAPI.SearchResultTextMatches, :t}],
      updated_at: {:string, :date_time}
    ]
  end
end
