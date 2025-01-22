defmodule GitHubOpenAPI.CodeScanningDefaultSetupUpdateResponse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :run_id, :integer
    field :run_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:run_id, :run_url, :__info__, :__joins__])
    
  end
end
