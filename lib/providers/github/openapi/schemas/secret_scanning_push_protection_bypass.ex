defmodule GitHubOpenAPI.SecretScanningPushProtectionBypass do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :expire_at, :string
    field :token_type, :string
    embeds_one :reason, GitHubOpenAPI.SecretScanningPushProtectionBypassReason
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:expire_at, :token_type, :__info__, :__joins__])
        |> cast_embed(:reason, with: &GitHubOpenAPI.SecretScanningPushProtectionBypassReason.changeset/2)
  end
end
