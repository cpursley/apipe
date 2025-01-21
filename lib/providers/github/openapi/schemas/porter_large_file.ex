defmodule GitHubOpenAPI.PorterLargeFile do
  @moduledoc """
  Provides struct and type for a PorterLargeFile
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          oid: String.t(),
          path: String.t(),
          ref_name: String.t(),
          size: integer
        }

  defstruct [:__info__, :__joins__, :oid, :path, :ref_name, :size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      oid: {:string, :generic},
      path: {:string, :generic},
      ref_name: {:string, :generic},
      size: :integer
    ]
  end
end
