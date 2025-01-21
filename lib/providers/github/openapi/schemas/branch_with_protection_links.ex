defmodule GitHubOpenAPI.BranchWithProtectionLinks do
  @moduledoc """
  Provides struct and type for a BranchWithProtectionLinks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, html: String.t(), self: String.t()}

  defstruct [:__info__, :__joins__, :html, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [html: {:string, :generic}, self: {:string, :uri}]
  end
end
