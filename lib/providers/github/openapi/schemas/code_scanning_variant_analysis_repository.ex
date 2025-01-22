defmodule GitHubOpenAPI.CodeScanningVariantAnalysisRepository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :full_name, :string
    field :id, :integer
    field :name, :string
    field :private, :boolean
    field :stargazers_count, :integer
    field :updated_at, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:full_name, :id, :name, :private, :stargazers_count, :updated_at, :__info__, :__joins__])
    
  end
end
