defmodule GitHubOpenAPI.Artifact do
  @moduledoc """
  Provides struct and type for a Artifact
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          archive_download_url: String.t(),
          created_at: DateTime.t() | nil,
          expired: boolean,
          expires_at: DateTime.t() | nil,
          id: integer,
          name: String.t(),
          node_id: String.t(),
          size_in_bytes: integer,
          updated_at: DateTime.t() | nil,
          url: String.t(),
          workflow_run: GitHubOpenAPI.ArtifactWorkflowRun.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :archive_download_url,
    :created_at,
    :expired,
    :expires_at,
    :id,
    :name,
    :node_id,
    :size_in_bytes,
    :updated_at,
    :url,
    :workflow_run
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archive_download_url: {:string, :generic},
      created_at: {:string, :date_time},
      expired: :boolean,
      expires_at: {:string, :date_time},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      size_in_bytes: :integer,
      updated_at: {:string, :date_time},
      url: {:string, :generic},
      workflow_run: {GitHubOpenAPI.ArtifactWorkflowRun, :t}
    ]
  end
end
