defmodule GitHubOpenAPI.CopilotSeatBreakdown do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :active_this_cycle, :integer
    field :added_this_cycle, :integer
    field :inactive_this_cycle, :integer
    field :pending_cancellation, :integer
    field :pending_invitation, :integer
    field :total, :integer
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:active_this_cycle, :added_this_cycle, :inactive_this_cycle, :pending_cancellation, :pending_invitation, :total, :__info__, :__joins__])
    
  end
end
