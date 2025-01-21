defmodule GitHubOpenAPI.CodeScanningDefaultSetupOptions do
  @moduledoc """
  Provides struct and type for a CodeScanningDefaultSetupOptions
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          runner_label: String.t() | nil,
          runner_type: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :runner_label, :runner_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      runner_label: {:union, [{:string, :generic}, :null]},
      runner_type: {:enum, ["standard", "labeled", "not_set"]}
    ]
  end
end
