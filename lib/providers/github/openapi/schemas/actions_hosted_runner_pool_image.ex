defmodule GitHubOpenAPI.ActionsHostedRunnerPoolImage do
  @moduledoc """
  Provides struct and type for a ActionsHostedRunnerPoolImage
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          display_name: String.t(),
          id: String.t(),
          size_gb: integer,
          source: String.t(),
          version: String.t()
        }

  defstruct [:__info__, :__joins__, :display_name, :id, :size_gb, :source, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_name: {:string, :generic},
      id: {:string, :generic},
      size_gb: :integer,
      source: {:enum, ["github", "partner", "custom"]},
      version: {:string, :generic}
    ]
  end
end
