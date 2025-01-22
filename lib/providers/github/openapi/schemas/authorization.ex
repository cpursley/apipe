defmodule GitHubOpenAPI.Authorization do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :app, :map
    field :created_at, :string
    field :expires_at, :string
    field :fingerprint, :string
    field :hashed_token, :string
    field :id, :integer
    field :note, :string
    field :note_url, :string
    field :scopes, {:array, :string}
    field :token, :string
    field :token_last_eight, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :installation, GitHubOpenAPI.NullableScopedInstallation
    embeds_one :user, GitHubOpenAPI.NullableSimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :expires_at, :fingerprint, :hashed_token, :id, :note, :note_url, :scopes, :token, :token_last_eight, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:installation, with: &GitHubOpenAPI.NullableScopedInstallation.changeset/2)
    |> cast_embed(:user, with: &GitHubOpenAPI.NullableSimpleUser.changeset/2)
  end
end
