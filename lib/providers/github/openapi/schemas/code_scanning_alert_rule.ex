defmodule GitHubOpenAPI.CodeScanningAlertRule do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :description, :string
    field :full_description, :string
    field :help, :string
    field :help_uri, :string
    field :id, :string
    field :name, :string
    field :security_severity_level, Ecto.Enum, values: [:low, :medium, :high, :critical]
    field :severity, Ecto.Enum, values: [:none, :note, :warning, :error]
    field :tags, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:description, :full_description, :help, :help_uri, :id, :name, :security_severity_level, :severity, :tags, :__info__, :__joins__])
    
  end
end
