defmodule GitHubOpenAPI.FilePathRestriction do
  @moduledoc """
  Provides struct and type for a FilePathRestriction
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          parameters: GitHubOpenAPI.FilePathRestrictionParameters.t() | nil,
          type: String.t()
        }

  defstruct [:__info__, :__joins__, :parameters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      parameters: {GitHubOpenAPI.FilePathRestrictionParameters, :t},
      type: {:const, "file_path_restriction"}
    ]
  end
end
