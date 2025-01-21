defmodule GitHubOpenAPI.Package do
  @moduledoc """
  Provides struct and type for a Package
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t(),
          html_url: String.t(),
          id: integer,
          name: String.t(),
          owner: GitHubOpenAPI.SimpleUser.t() | nil,
          package_type: String.t(),
          repository: GitHubOpenAPI.MinimalRepository.t() | nil,
          updated_at: DateTime.t(),
          url: String.t(),
          version_count: integer,
          visibility: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :created_at,
    :html_url,
    :id,
    :name,
    :owner,
    :package_type,
    :repository,
    :updated_at,
    :url,
    :version_count,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      html_url: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      owner: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      package_type: {:enum, ["npm", "maven", "rubygems", "docker", "nuget", "container"]},
      repository: {:union, [{GitHubOpenAPI.MinimalRepository, :t}, :null]},
      updated_at: {:string, :date_time},
      url: {:string, :generic},
      version_count: :integer,
      visibility: {:enum, ["private", "public"]}
    ]
  end
end
