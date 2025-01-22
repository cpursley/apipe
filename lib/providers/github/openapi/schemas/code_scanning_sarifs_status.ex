defmodule GitHubOpenAPI.CodeScanningSarifsStatus do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :analyses_url, :string
    field :errors, {:array, :string}
    field :processing_status, Ecto.Enum, values: [:pending, :complete, :failed]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:analyses_url, :errors, :processing_status, :__info__, :__joins__])
    
  end
end
