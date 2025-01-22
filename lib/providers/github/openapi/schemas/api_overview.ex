defmodule GitHubOpenAPI.ApiOverview do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :actions, {:array, :string}
    field :actions_macos, {:array, :string}
    field :api, {:array, :string}
    field :codespaces, {:array, :string}
    field :copilot, {:array, :string}
    field :dependabot, {:array, :string}
    field :domains, :map
    field :git, {:array, :string}
    field :github_enterprise_importer, {:array, :string}
    field :hooks, {:array, :string}
    field :importer, {:array, :string}
    field :packages, {:array, :string}
    field :pages, {:array, :string}
    field :ssh_key_fingerprints, :map
    field :ssh_keys, {:array, :string}
    field :verifiable_password_authentication, :boolean
    field :web, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:actions, :actions_macos, :api, :codespaces, :copilot, :dependabot, :git, :github_enterprise_importer, :hooks, :importer, :packages, :pages, :ssh_keys, :verifiable_password_authentication, :web, :__info__, :__joins__])
    
  end
end
