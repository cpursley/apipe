defmodule GitHubOpenAPI.ScopedInstallation do
  @moduledoc """
  Provides struct and type for a ScopedInstallation
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          account: GitHubOpenAPI.SimpleUser.t(),
          has_multiple_single_files: boolean | nil,
          permissions: GitHubOpenAPI.AppPermissions.t(),
          repositories_url: String.t(),
          repository_selection: String.t(),
          single_file_name: String.t() | nil,
          single_file_paths: [String.t()] | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :account,
    :has_multiple_single_files,
    :permissions,
    :repositories_url,
    :repository_selection,
    :single_file_name,
    :single_file_paths
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      account: {GitHubOpenAPI.SimpleUser, :t},
      has_multiple_single_files: :boolean,
      permissions: {GitHubOpenAPI.AppPermissions, :t},
      repositories_url: {:string, :uri},
      repository_selection: {:enum, ["all", "selected"]},
      single_file_name: {:union, [{:string, :generic}, :null]},
      single_file_paths: [string: :generic]
    ]
  end
end
