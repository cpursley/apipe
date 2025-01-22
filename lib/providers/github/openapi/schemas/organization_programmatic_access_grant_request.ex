defmodule GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequest do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :id, :integer
    field :permissions, :map
    field :reason, :string
    field :repositories_url, :string
    field :repository_selection, Ecto.Enum, values: [:none, :all, :subset]
    field :token_expired, :boolean
    field :token_expires_at, :string
    field :token_id, :integer
    field :token_last_used_at, :string
    field :token_name, :string
    embeds_one :owner, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :id, :reason, :repositories_url, :repository_selection, :token_expired, :token_expires_at, :token_id, :token_last_used_at, :token_name, :__info__, :__joins__])
        |> cast_embed(:owner, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
