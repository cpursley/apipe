defmodule GitHubOpenAPI.CodeScanningSarifsReceipt do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :url, :string
    embeds_one :id, GitHubOpenAPI.CodeScanningAnalysisSarifId
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:url, :__info__, :__joins__])
        |> cast_embed(:id, with: &GitHubOpenAPI.CodeScanningAnalysisSarifId.changeset/2)
  end
end
