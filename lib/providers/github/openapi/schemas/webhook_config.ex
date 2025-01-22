defmodule GitHubOpenAPI.WebhookConfig do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    embeds_one :content_type, GitHubOpenAPI.WebhookConfigContentType
    embeds_one :insecure_ssl, GitHubOpenAPI.WebhookConfigInsecureSsl
    embeds_one :secret, GitHubOpenAPI.WebhookConfigSecret
    embeds_one :url, GitHubOpenAPI.WebhookConfigUrl
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
        |> cast_embed(:content_type, with: &GitHubOpenAPI.WebhookConfigContentType.changeset/2)
    |> cast_embed(:insecure_ssl, with: &GitHubOpenAPI.WebhookConfigInsecureSsl.changeset/2)
    |> cast_embed(:secret, with: &GitHubOpenAPI.WebhookConfigSecret.changeset/2)
    |> cast_embed(:url, with: &GitHubOpenAPI.WebhookConfigUrl.changeset/2)
  end
end
