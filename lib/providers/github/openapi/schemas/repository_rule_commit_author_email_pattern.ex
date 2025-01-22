defmodule GitHubOpenAPI.RepositoryRuleCommitAuthorEmailPattern do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :parameters, :map
    field :type, Ecto.Enum, values: [:commit_author_email_pattern]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:type, :__info__, :__joins__])
    
  end
end
