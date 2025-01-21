defmodule GitHubOpenAPI.ContributorActivityWeeks do
  @moduledoc """
  Provides struct and type for a ContributorActivityWeeks
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          a: integer | nil,
          c: integer | nil,
          d: integer | nil,
          w: integer | nil
        }

  defstruct [:__info__, :__joins__, :a, :c, :d, :w]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [a: :integer, c: :integer, d: :integer, w: :integer]
  end
end
