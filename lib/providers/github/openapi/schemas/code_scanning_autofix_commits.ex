defmodule GitHubOpenAPI.CodeScanningAutofixCommits do
  @moduledoc """
  Provides struct and type for a CodeScanningAutofixCommits
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          message: String.t() | nil,
          target_ref: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :message, :target_ref]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: {:string, :generic}, target_ref: {:string, :generic}]
  end
end
