defmodule GitHubOpenAPI.FileExtensionRestriction do
  @moduledoc """
  Provides struct and type for a FileExtensionRestriction
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          parameters: GitHubOpenAPI.FileExtensionRestrictionParameters.t() | nil,
          type: String.t()
        }

  defstruct [:__info__, :parameters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      parameters: {GitHubOpenAPI.FileExtensionRestrictionParameters, :t},
      type: {:const, "file_extension_restriction"}
    ]
  end
end
