defmodule GitHubOpenAPI.GitCommit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :author, :map
    field :committer, :map
    field :html_url, :string
    field :message, :string
    field :node_id, :string
    field :parents, {:array, :string}
    field :sha, :string
    field :tree, :map
    field :url, :string
    field :verification, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:html_url, :message, :node_id, :parents, :sha, :url, :__info__, :__joins__])
    
  end
end
