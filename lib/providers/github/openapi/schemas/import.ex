defmodule GitHubOpenAPI.Import do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :authors_count, :integer
    field :authors_url, :string
    field :commit_count, :integer
    field :error_message, :string
    field :failed_step, :string
    field :has_large_files, :boolean
    field :html_url, :string
    field :import_percent, :integer
    field :large_files_count, :integer
    field :large_files_size, :integer
    field :message, :string
    field :project_choices, {:array, :string}
    field :push_percent, :integer
    field :repository_url, :string
    field :status, Ecto.Enum, values: [:auth, :error, :none, :detecting, :choose, :auth_failed, :importing, :mapping, :waiting_to_push, :pushing, :complete, :setup, :unknown, :detection_found_multiple, :detection_found_nothing, :detection_needs_auth]
    field :status_text, :string
    field :svc_root, :string
    field :svn_root, :string
    field :tfvc_project, :string
    field :url, :string
    field :use_lfs, :boolean
    field :vcs, :string
    field :vcs_url, :string
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:authors_count, :authors_url, :commit_count, :error_message, :failed_step, :has_large_files, :html_url, :import_percent, :large_files_count, :large_files_size, :message, :project_choices, :push_percent, :repository_url, :status, :status_text, :svc_root, :svn_root, :tfvc_project, :url, :use_lfs, :vcs, :vcs_url, :__info__, :__joins__])
    
  end
end
