defmodule GitHubOpenAPI.ReleaseNotesContent do
  @moduledoc """
  Provides struct and type for a ReleaseNotesContent
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, body: String.t(), name: String.t()}

  defstruct [:__info__, :body, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [body: {:string, :generic}, name: {:string, :generic}]
  end
end
