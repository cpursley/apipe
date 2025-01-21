defmodule GitHubOpenAPI.ActionsHostedRunnerMachineSpec do
  @moduledoc """
  Provides struct and type for a ActionsHostedRunnerMachineSpec
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          cpu_cores: integer,
          id: String.t(),
          memory_gb: integer,
          storage_gb: integer
        }

  defstruct [:__info__, :__joins__, :cpu_cores, :id, :memory_gb, :storage_gb]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cpu_cores: :integer, id: {:string, :generic}, memory_gb: :integer, storage_gb: :integer]
  end
end
