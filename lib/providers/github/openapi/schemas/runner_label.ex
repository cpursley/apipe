defmodule GitHubOpenAPI.RunnerLabel do
  @moduledoc """
  Provides struct and type for a RunnerLabel
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: integer | nil,
          name: String.t(),
          type: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :id, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer, name: {:string, :generic}, type: {:enum, ["read-only", "custom"]}]
  end
end
