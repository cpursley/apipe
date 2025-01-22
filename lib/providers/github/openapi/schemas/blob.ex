defmodule GitHubOpenAPI.Blob do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :content, :string
    field :encoding, :string
    field :highlighted_content, :string
    field :node_id, :string
    field :sha, :string
    field :size, :integer
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:content, :encoding, :highlighted_content, :node_id, :sha, :size, :url, :__info__, :__joins__])
    
  end
end
