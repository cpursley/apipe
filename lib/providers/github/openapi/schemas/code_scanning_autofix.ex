defmodule GitHubOpenAPI.CodeScanningAutofix do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    embeds_one :description, GitHubOpenAPI.CodeScanningAutofixDescription
    embeds_one :started_at, GitHubOpenAPI.CodeScanningAutofixStartedAt
    embeds_one :status, GitHubOpenAPI.CodeScanningAutofixStatus
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
        |> cast_embed(:description, with: &GitHubOpenAPI.CodeScanningAutofixDescription.changeset/2)
    |> cast_embed(:started_at, with: &GitHubOpenAPI.CodeScanningAutofixStartedAt.changeset/2)
    |> cast_embed(:status, with: &GitHubOpenAPI.CodeScanningAutofixStatus.changeset/2)
  end
end
