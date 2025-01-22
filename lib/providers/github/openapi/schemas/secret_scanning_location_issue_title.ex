defmodule GitHubOpenAPI.SecretScanningLocationIssueTitle do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :issue_title_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:issue_title_url, :__info__, :__joins__])
    
  end
end
