defmodule GitHubOpenAPI.SecretScanningLocationPullRequestBody do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :pull_request_body_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:pull_request_body_url, :__info__, :__joins__])
    
  end
end
