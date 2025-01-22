defmodule GitHubOpenAPI.ReferencedWorkflow do
  @moduledoc """
  Provides struct and type for a ReferencedWorkflow
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          path: String.t(),
          ref: String.t() | nil,
          sha: String.t()
        }

  defstruct [:__info__, :__joins__, :path, :ref, :sha]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [path: {:string, :generic}, ref: {:string, :generic}, sha: {:string, :generic}]
  end
end
