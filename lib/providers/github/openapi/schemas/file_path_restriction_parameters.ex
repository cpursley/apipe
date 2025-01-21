defmodule GitHubOpenAPI.FilePathRestrictionParameters do
  @moduledoc """
  Provides struct and type for a FilePathRestrictionParameters
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, restricted_file_paths: [String.t()]}

  defstruct [:__info__, :__joins__, :restricted_file_paths]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [restricted_file_paths: [string: :generic]]
  end
end
