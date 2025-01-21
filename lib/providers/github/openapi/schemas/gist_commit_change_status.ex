defmodule GitHubOpenAPI.GistCommitChangeStatus do
  @moduledoc """
  Provides struct and type for a GistCommitChangeStatus
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          additions: integer | nil,
          deletions: integer | nil,
          total: integer | nil
        }

  defstruct [:__info__, :__joins__, :additions, :deletions, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [additions: :integer, deletions: :integer, total: :integer]
  end
end
