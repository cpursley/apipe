defmodule GitHubOpenAPI.CodeScanningAutofix do
  @moduledoc """
  Provides struct and type for a CodeScanningAutofix
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          description: String.t() | nil,
          started_at: DateTime.t(),
          status: String.t()
        }

  defstruct [:__info__, :__joins__, :description, :started_at, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      started_at: {:string, :date_time},
      status: {:enum, ["pending", "error", "success", "outdated"]}
    ]
  end
end
