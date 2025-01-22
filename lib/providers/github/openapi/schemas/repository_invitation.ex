defmodule GitHubOpenAPI.RepositoryInvitation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :expired, :boolean
    field :html_url, :string
    field :id, :integer
    field :node_id, :string
    field :permissions, Ecto.Enum, values: [:read, :write, :admin, :triage, :maintain]
    field :url, :string
    embeds_one :invitee, GitHubOpenAPI.NullableSimpleUser
    embeds_one :inviter, GitHubOpenAPI.NullableSimpleUser
    embeds_one :repository, GitHubOpenAPI.MinimalRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :expired, :html_url, :id, :node_id, :permissions, :url, :__info__, :__joins__])
        |> cast_embed(:invitee, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:inviter, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
    |> cast_embed(:repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
  end
end
