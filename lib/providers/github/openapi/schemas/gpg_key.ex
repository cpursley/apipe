defmodule GitHubOpenAPI.GpgKey do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :can_certify, :boolean
    field :can_encrypt_comms, :boolean
    field :can_encrypt_storage, :boolean
    field :can_sign, :boolean
    field :created_at, :string
    field :emails, {:array, :string}
    field :expires_at, :string
    field :id, :integer
    field :key_id, :string
    field :name, :string
    field :primary_key_id, :integer
    field :public_key, :string
    field :raw_key, :string
    field :revoked, :boolean
    field :subkeys, {:array, :string}
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:can_certify, :can_encrypt_comms, :can_encrypt_storage, :can_sign, :created_at, :emails, :expires_at, :id, :key_id, :name, :primary_key_id, :public_key, :raw_key, :revoked, :subkeys, :__info__, :__joins__])
    
  end
end
