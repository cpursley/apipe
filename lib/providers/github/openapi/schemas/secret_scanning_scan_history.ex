defmodule GitHubOpenAPI.SecretScanningScanHistory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :custom_pattern_backfill_scans, {:array, :string}
    embeds_many :backfill_scans, GitHubOpenAPI.SecretScanningScan
    embeds_many :incremental_scans, GitHubOpenAPI.SecretScanningScan
    embeds_many :pattern_update_scans, GitHubOpenAPI.SecretScanningScan
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:custom_pattern_backfill_scans, :__info__, :__joins__])
        |> cast_embed(:backfill_scans, with: &GitHubOpenAPI.SecretScanningScan.changeset/2)
    |> cast_embed(:incremental_scans, with: &GitHubOpenAPI.SecretScanningScan.changeset/2)
    |> cast_embed(:pattern_update_scans, with: &GitHubOpenAPI.SecretScanningScan.changeset/2)
  end
end
