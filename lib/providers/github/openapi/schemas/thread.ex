defmodule GitHubOpenAPI.Thread do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :string
    field :last_read_at, :string
    field :reason, :string
    field :subject, :map
    field :subscription_url, :string
    field :unread, :boolean
    field :updated_at, :string
    field :url, :string
    embeds_one :repository, GitHubOpenAPI.MinimalRepository
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:id, :last_read_at, :reason, :subscription_url, :unread, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:repository, with: &GitHubOpenAPI.MinimalRepository.changeset/2)
  end
end
