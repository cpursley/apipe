defmodule GitHubOpenAPI.SnapshotJob do
  @moduledoc """
  Provides struct and type for a SnapshotJob
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          correlator: String.t(),
          html_url: String.t() | nil,
          id: String.t()
        }

  defstruct [:__info__, :correlator, :html_url, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [correlator: {:string, :generic}, html_url: {:string, :generic}, id: {:string, :generic}]
  end
end
