defmodule GitHubOpenAPI.Snapshot do
  @moduledoc """
  Provides struct and type for a Snapshot
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          detector: GitHubOpenAPI.SnapshotDetector.t(),
          job: GitHubOpenAPI.SnapshotJob.t(),
          manifests: GitHubOpenAPI.SnapshotManifests.t() | nil,
          metadata: GitHubOpenAPI.Metadata.t() | nil,
          ref: String.t(),
          scanned: DateTime.t(),
          sha: String.t(),
          version: integer
        }

  defstruct [
    :__info__,
    :__joins__,
    :detector,
    :job,
    :manifests,
    :metadata,
    :ref,
    :scanned,
    :sha,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      detector: {GitHubOpenAPI.SnapshotDetector, :t},
      job: {GitHubOpenAPI.SnapshotJob, :t},
      manifests: {GitHubOpenAPI.SnapshotManifests, :t},
      metadata: {GitHubOpenAPI.Metadata, :t},
      ref: {:string, :generic},
      scanned: {:string, :date_time},
      sha: {:string, :generic},
      version: :integer
    ]
  end
end
