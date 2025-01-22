defmodule GitHubOpenAPI.ContentTreeLinks do
  @moduledoc """
  Provides struct and type for a ContentTreeLinks
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          git: String.t() | nil,
          html: String.t() | nil,
          self: String.t()
        }

  defstruct [:__info__, :__joins__, :git, :html, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [git: {:string, :uri}, html: {:string, :uri}, self: {:string, :uri}]
  end
end
