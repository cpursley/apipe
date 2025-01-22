defmodule GitHubOpenAPI.CommunityProfileFiles do
  @moduledoc """
  Provides struct and type for a CommunityProfileFiles
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          code_of_conduct: GitHubOpenAPI.NullableCodeOfConductSimple.t(),
          code_of_conduct_file: GitHubOpenAPI.NullableCommunityHealthFile.t(),
          contributing: GitHubOpenAPI.NullableCommunityHealthFile.t(),
          issue_template: GitHubOpenAPI.NullableCommunityHealthFile.t(),
          license: GitHubOpenAPI.NullableLicenseSimple.t(),
          pull_request_template: GitHubOpenAPI.NullableCommunityHealthFile.t(),
          readme: GitHubOpenAPI.NullableCommunityHealthFile.t()
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
      code_of_conduct: {GitHubOpenAPI.NullableCodeOfConductSimple, :t},
      code_of_conduct_file: {GitHubOpenAPI.NullableCommunityHealthFile, :t},
      contributing: {GitHubOpenAPI.NullableCommunityHealthFile, :t},
      issue_template: {GitHubOpenAPI.NullableCommunityHealthFile, :t},
      license: {GitHubOpenAPI.NullableLicenseSimple, :t},
      pull_request_template: {GitHubOpenAPI.NullableCommunityHealthFile, :t},
      readme: {GitHubOpenAPI.NullableCommunityHealthFile, :t}
    ]
  end
end
