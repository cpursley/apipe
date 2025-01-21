defmodule GitHubOpenAPI.CodeScanningSarifsStatus do
  @moduledoc """
  Provides struct and type for a CodeScanningSarifsStatus
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          analyses_url: String.t() | nil,
          errors: [String.t()] | nil,
          processing_status: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :analyses_url, :errors, :processing_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      analyses_url: {:union, [{:string, :uri}, :null]},
      errors: {:union, [[string: :generic], :null]},
      processing_status: {:enum, ["pending", "complete", "failed"]}
    ]
  end
end
