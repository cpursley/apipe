defmodule GitHubOpenAPI.Runner do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :busy, :boolean
    field :id, :integer
    field :name, :string
    field :os, :string
    field :runner_group_id, :integer
    field :status, :string
    embeds_many :labels, GitHubOpenAPI.RunnerLabel
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:busy, :id, :name, :os, :runner_group_id, :status, :__info__, :__joins__])
        |> cast_embed(:labels, with: &GitHubOpenAPI.RunnerLabel.changeset/2)
  end
end
