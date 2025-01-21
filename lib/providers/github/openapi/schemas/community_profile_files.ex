defmodule GitHubOpenAPI.CommunityProfileFiles do
  @moduledoc """
  Provides struct and type for a CommunityProfileFiles
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          code_of_conduct: GitHubOpenAPI.CodeOfConductSimple.t() | nil,
          code_of_conduct_file: GitHubOpenAPI.CommunityHealthFile.t() | nil,
          contributing: GitHubOpenAPI.CommunityHealthFile.t() | nil,
          issue_template: GitHubOpenAPI.CommunityHealthFile.t() | nil,
          license: GitHubOpenAPI.LicenseSimple.t() | nil,
          pull_request_template: GitHubOpenAPI.CommunityHealthFile.t() | nil,
          readme: GitHubOpenAPI.CommunityHealthFile.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :code_of_conduct,
    :code_of_conduct_file,
    :contributing,
    :issue_template,
    :license,
    :pull_request_template,
    :readme
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_of_conduct: {:union, [{GitHubOpenAPI.CodeOfConductSimple, :t}, :null]},
      code_of_conduct_file: {:union, [{GitHubOpenAPI.CommunityHealthFile, :t}, :null]},
      contributing: {:union, [{GitHubOpenAPI.CommunityHealthFile, :t}, :null]},
      issue_template: {:union, [{GitHubOpenAPI.CommunityHealthFile, :t}, :null]},
      license: {:union, [{GitHubOpenAPI.LicenseSimple, :t}, :null]},
      pull_request_template: {:union, [{GitHubOpenAPI.CommunityHealthFile, :t}, :null]},
      readme: {:union, [{GitHubOpenAPI.CommunityHealthFile, :t}, :null]}
    ]
  end
end
