defmodule GitHubOpenAPI.PullRequestMinimalHeadRepo do
  @moduledoc """
  Provides struct and type for a PullRequestMinimalHeadRepo
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: integer,
          name: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :id, :name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer, name: {:string, :generic}, url: {:string, :generic}]
  end
end
