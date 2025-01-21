defmodule GitHubOpenAPI.ReleaseNotesContent do
  @moduledoc """
  Provides struct and type for a ReleaseNotesContent
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, body: String.t(), name: String.t()}

  defstruct [:__info__, :__joins__, :body, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [body: {:string, :generic}, name: {:string, :generic}]
  end
end
