defmodule GitHubOpenAPI.FileCommitCommitCommitter do
  @moduledoc """
  Provides struct and type for a FileCommitCommitCommitter
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          date: String.t() | nil,
          email: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :date, :email, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date: {:string, :generic}, email: {:string, :generic}, name: {:string, :generic}]
  end
end
