defmodule GitHubOpenAPI.RepositoryAdvisoryCreate do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :credits, {:array, :string}
    field :cve_id, :string
    field :cvss_vector_string, :string
    field :cwe_ids, {:array, :string}
    field :description, :string
    field :severity, Ecto.Enum, values: [:critical, :high, :medium, :low]
    field :start_private_fork, :boolean
    field :summary, :string
    field :vulnerabilities, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:credits, :cve_id, :cvss_vector_string, :cwe_ids, :description, :severity, :start_private_fork, :summary, :vulnerabilities, :__info__, :__joins__])
    
  end
end
