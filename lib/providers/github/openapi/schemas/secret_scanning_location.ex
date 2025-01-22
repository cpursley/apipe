defmodule GitHubOpenAPI.SecretScanningLocation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :details, :map
    field :type, Ecto.Enum, values: [:commit, :wiki_commit, :issue_title, :issue_body, :issue_comment, :discussion_title, :discussion_body, :discussion_comment, :pull_request_title, :pull_request_body, :pull_request_comment, :pull_request_review, :pull_request_review_comment]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:details, :type, :__info__, :__joins__])
    
  end
end
