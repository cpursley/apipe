defmodule GitHubOpenAPI.PagesHttpsCertificate do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :description, :string
    field :domains, {:array, :string}
    field :expires_at, :string
    field :state, Ecto.Enum, values: [:new, :authorization_created, :authorization_pending, :authorized, :authorization_revoked, :issued, :uploaded, :approved, :errored, :bad_authz, :destroy_pending, :dns_changed]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:description, :domains, :expires_at, :state, :__info__, :__joins__])
    
  end
end
