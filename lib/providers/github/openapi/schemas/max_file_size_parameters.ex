defmodule GitHubOpenAPI.MaxFileSizeParameters do
  @moduledoc """
  Provides struct and type for a MaxFileSizeParameters
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, max_file_size: integer}

  defstruct [:__info__, :__joins__, :max_file_size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max_file_size: :integer]
  end
end
