defmodule GitHubOpenAPI.CommunityProfile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :content_reports_enabled, :boolean
    field :description, :string
    field :documentation, :string
    field :files, :map
    field :health_percentage, :integer
    field :updated_at, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:content_reports_enabled, :description, :documentation, :health_percentage, :updated_at, :__info__, :__joins__])
    
  end
end
