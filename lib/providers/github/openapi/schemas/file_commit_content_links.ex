defmodule GitHubOpenAPI.FileCommitContentLinks do
  @moduledoc """
  Provides struct and type for a FileCommitContentLinks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          git: String.t() | nil,
          html: String.t() | nil,
          self: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :git, :html, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [git: {:string, :generic}, html: {:string, :generic}, self: {:string, :generic}]
  end
end
