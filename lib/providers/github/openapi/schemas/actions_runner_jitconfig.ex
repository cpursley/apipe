defmodule GitHubOpenAPI.ActionsRunnerJitconfig do
  @moduledoc """
  Provides struct and type for a ActionsRunnerJitconfig
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type json_resp :: %__MODULE__{
          __info__: map,
          __joins__: map,
          encoded_jit_config: String.t(),
          runner: GitHubOpenAPI.Runner.t()
        }

  defstruct [:__info__, :__joins__, :encoded_jit_config, :runner]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [encoded_jit_config: {:string, :generic}, runner: {GitHubOpenAPI.Runner, :t}]
  end
end
