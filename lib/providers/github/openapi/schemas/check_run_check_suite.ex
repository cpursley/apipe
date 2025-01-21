defmodule GitHubOpenAPI.CheckRunCheckSuite do
  @moduledoc """
  Provides struct and type for a CheckRunCheckSuite
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, id: integer}

  defstruct [:__info__, :__joins__, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer]
  end
end
