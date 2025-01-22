defmodule GitHubOpenAPI.RepositoryAdvisoryUpdate do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :collaborating_teams, {:array, :string}
    field :collaborating_users, {:array, :string}
    field :credits, {:array, :string}
    field :cve_id, :string
    field :cvss_vector_string, :string
    field :cwe_ids, {:array, :string}
    field :description, :string
    field :severity, Ecto.Enum, values: [:critical, :high, :medium, :low]
    field :state, Ecto.Enum, values: [:published, :closed, :draft]
    field :summary, :string
    field :vulnerabilities, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:collaborating_teams, :collaborating_users, :credits, :cve_id, :cvss_vector_string, :cwe_ids, :description, :severity, :state, :summary, :vulnerabilities, :__info__, :__joins__])
    
  end
end
