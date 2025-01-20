defmodule GitHubOpenAPI.CodeownersErrors do
  @moduledoc """
  Provides struct and type for a CodeownersErrors
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, errors: [GitHubOpenAPI.CodeownersErrorsErrors.t()]}

  defstruct [:__info__, :errors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [errors: [{GitHubOpenAPI.CodeownersErrorsErrors, :t}]]
  end
end
