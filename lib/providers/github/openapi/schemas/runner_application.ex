defmodule GitHubOpenAPI.RunnerApplication do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :architecture, :string
    field :download_url, :string
    field :filename, :string
    field :os, :string
    field :sha256_checksum, :string
    field :temp_download_token, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:architecture, :download_url, :filename, :os, :sha256_checksum, :temp_download_token, :__info__, :__joins__])
    
  end
end
