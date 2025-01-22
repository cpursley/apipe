defmodule GitHubOpenAPI.SecurityAndAnalysis do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :advanced_security, :map
    field :dependabot_security_updates, :map
    field :secret_scanning, :map
    field :secret_scanning_ai_detection, :map
    field :secret_scanning_non_provider_patterns, :map
    field :secret_scanning_push_protection, :map
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:__info__, :__joins__])
    
  end
end
