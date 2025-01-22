defmodule GitHubOpenAPI.ActionsHostedRunnerImage do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :display_name, :string
    field :id, :string
    field :platform, :string
    field :size_gb, :integer
    field :source, Ecto.Enum, values: [:github, :partner, :custom]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:display_name, :id, :platform, :size_gb, :source, :__info__, :__joins__])
    
  end
end
