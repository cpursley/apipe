defmodule GitHubOpenAPI.Hook do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :active, :boolean
    field :created_at, :string
    field :deliveries_url, :string
    field :events, {:array, :string}
    field :id, :integer
    field :name, :string
    field :ping_url, :string
    field :test_url, :string
    field :type, :string
    field :updated_at, :string
    field :url, :string
    embeds_one :config, GitHubOpenAPI.WebhookConfig
    embeds_one :last_response, GitHubOpenAPI.HookResponse
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:active, :created_at, :deliveries_url, :events, :id, :name, :ping_url, :test_url, :type, :updated_at, :url, :__info__, :__joins__])
        |> cast_embed(:config, with: &GitHubOpenAPI.WebhookConfig.changeset/2)
    |> cast_embed(:last_response, with: &GitHubOpenAPI.HookResponse.changeset/2)
  end
end
