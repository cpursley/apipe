defmodule GitHubOpenAPI.ProtectedBranchRequiredStatusCheckChecks do
  @moduledoc """
  Provides struct and type for a ProtectedBranchRequiredStatusCheckChecks
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          app_id: integer | nil,
          context: String.t()
        }

  defstruct [:__info__, :__joins__, :app_id, :context]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [app_id: {:union, [:integer, :null]}, context: {:string, :generic}]
  end
end
