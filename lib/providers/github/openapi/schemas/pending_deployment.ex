defmodule GitHubOpenAPI.PendingDeployment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :current_user_can_approve, :boolean
    field :environment, :map
    field :reviewers, {:array, :string}
    field :wait_timer, :integer
    field :wait_timer_started_at, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:current_user_can_approve, :reviewers, :wait_timer, :wait_timer_started_at, :__info__, :__joins__])
    
  end
end
