defmodule GitHubOpenAPI.FileExtensionRestrictionParameters do
  @moduledoc """
  Provides struct and type for a FileExtensionRestrictionParameters
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, restricted_file_extensions: [String.t()]}

  defstruct [:__info__, :__joins__, :restricted_file_extensions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [restricted_file_extensions: [string: :generic]]
  end
end
