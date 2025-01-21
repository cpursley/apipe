defmodule GitHubOpenAPI.CodeScanningAnalysisTool do
  @moduledoc """
  Provides struct and type for a CodeScanningAnalysisTool
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          guid: String.t() | nil,
          name: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :guid, :name, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      guid: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic},
      version: {:union, [{:string, :generic}, :null]}
    ]
  end
end
