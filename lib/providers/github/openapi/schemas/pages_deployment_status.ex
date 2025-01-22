defmodule GitHubOpenAPI.PagesDeploymentStatus do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :status, Ecto.Enum, values: [:deployment_in_progress, :syncing_files, :finished_file_sync, :updating_pages, :purging_cdn, :deployment_cancelled, :deployment_failed, :deployment_content_failed, :deployment_attempt_error, :deployment_lost, :succeed]
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:status, :__info__, :__joins__])
    
  end
end
