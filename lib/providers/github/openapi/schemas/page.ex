defmodule GitHubOpenAPI.Page do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :build_type, Ecto.Enum, values: [:legacy, :workflow]
    field :cname, :string
    field :custom_404, :boolean
    field :html_url, :string
    field :https_enforced, :boolean
    field :pending_domain_unverified_at, :string
    field :protected_domain_state, Ecto.Enum, values: [:pending, :verified, :unverified]
    field :public, :boolean
    field :status, Ecto.Enum, values: [:built, :building, :errored]
    field :url, :string
    embeds_one :https_certificate, GitHubOpenAPI.PagesHttpsCertificate
    embeds_one :source, GitHubOpenAPI.PagesSourceHash
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:build_type, :cname, :custom_404, :html_url, :https_enforced, :pending_domain_unverified_at, :protected_domain_state, :public, :status, :url, :__info__, :__joins__])
        |> cast_embed(:https_certificate, with: &GitHubOpenAPI.PagesHttpsCertificate.changeset/2)
    |> cast_embed(:source, with: &GitHubOpenAPI.PagesSourceHash.changeset/2)
  end
end
