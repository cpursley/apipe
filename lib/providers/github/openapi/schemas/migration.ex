defmodule GitHubOpenAPI.Migration do
  @moduledoc """
  Provides struct and type for a Migration
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          archive_url: String.t() | nil,
          created_at: DateTime.t(),
          exclude: [String.t()] | nil,
          exclude_attachments: boolean,
          exclude_git_data: boolean,
          exclude_metadata: boolean,
          exclude_owner_projects: boolean,
          exclude_releases: boolean,
          guid: String.t(),
          id: integer,
          lock_repositories: boolean,
          node_id: String.t(),
          org_metadata_only: boolean,
          owner: GitHubOpenAPI.SimpleUser.t() | nil,
          repositories: [GitHubOpenAPI.Repository.t()],
          state: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :archive_url,
    :created_at,
    :exclude,
    :exclude_attachments,
    :exclude_git_data,
    :exclude_metadata,
    :exclude_owner_projects,
    :exclude_releases,
    :guid,
    :id,
    :lock_repositories,
    :node_id,
    :org_metadata_only,
    :owner,
    :repositories,
    :state,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archive_url: {:string, :uri},
      created_at: {:string, :date_time},
      exclude: [string: :generic],
      exclude_attachments: :boolean,
      exclude_git_data: :boolean,
      exclude_metadata: :boolean,
      exclude_owner_projects: :boolean,
      exclude_releases: :boolean,
      guid: {:string, :generic},
      id: :integer,
      lock_repositories: :boolean,
      node_id: {:string, :generic},
      org_metadata_only: :boolean,
      owner: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      repositories: [{GitHubOpenAPI.Repository, :t}],
      state: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
