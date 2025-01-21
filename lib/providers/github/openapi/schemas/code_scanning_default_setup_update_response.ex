defmodule GitHubOpenAPI.CodeScanningDefaultSetupUpdateResponse do
  @moduledoc """
  Provides struct and type for a CodeScanningDefaultSetupUpdateResponse
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          run_id: integer | nil,
          run_url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :run_id, :run_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [run_id: :integer, run_url: {:string, :generic}]
  end
end
