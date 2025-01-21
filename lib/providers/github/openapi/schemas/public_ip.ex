defmodule GitHubOpenAPI.PublicIp do
  @moduledoc """
  Provides struct and type for a PublicIp
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          enabled: boolean | nil,
          length: integer | nil,
          prefix: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :enabled, :length, :prefix]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [enabled: :boolean, length: :integer, prefix: {:string, :generic}]
  end
end
