defmodule GitHubOpenAPI.IntegrationInstallationRequest do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :account, :map
    field :created_at, :string
    field :id, :integer
    field :node_id, :string
    embeds_one :requester, GitHubOpenAPI.SimpleUser
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:account, :created_at, :id, :node_id, :__info__, :__joins__])
        |> cast_embed(:requester, with: &GitHubOpenAPI.SimpleUser.changeset/2)
  end
end
