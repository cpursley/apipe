defmodule GitHubOpenAPI.ThreadSubscription do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :created_at, :string
    field :ignored, :boolean
    field :reason, :string
    field :repository_url, :string
    field :subscribed, :boolean
    field :thread_url, :string
    field :url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:created_at, :ignored, :reason, :repository_url, :subscribed, :thread_url, :url, :__info__, :__joins__])
    
  end
end
