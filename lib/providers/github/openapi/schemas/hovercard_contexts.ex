defmodule GitHubOpenAPI.HovercardContexts do
  @moduledoc """
  Provides struct and type for a HovercardContexts
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, message: String.t(), octicon: String.t()}

  defstruct [:__info__, :__joins__, :message, :octicon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: {:string, :generic}, octicon: {:string, :generic}]
  end
end
