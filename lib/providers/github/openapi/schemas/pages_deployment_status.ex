defmodule GitHubOpenAPI.PagesDeploymentStatus do
  @moduledoc """
  Provides struct and type for a PagesDeploymentStatus
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, status: String.t() | nil}

  defstruct [:__info__, :__joins__, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      status:
        {:enum,
         [
           "deployment_in_progress",
           "syncing_files",
           "finished_file_sync",
           "updating_pages",
           "purging_cdn",
           "deployment_cancelled",
           "deployment_failed",
           "deployment_content_failed",
           "deployment_attempt_error",
           "deployment_lost",
           "succeed"
         ]}
    ]
  end
end
