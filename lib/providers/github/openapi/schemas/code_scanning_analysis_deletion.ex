defmodule GitHubOpenAPI.CodeScanningAnalysisDeletion do
  @moduledoc """
  Provides struct and type for a CodeScanningAnalysisDeletion
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          confirm_delete_url: String.t() | nil,
          next_analysis_url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :confirm_delete_url, :next_analysis_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [confirm_delete_url: {:string, :uri}, next_analysis_url: {:string, :uri}]
  end
end
