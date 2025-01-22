defmodule GitHubOpenAPI.CodespaceWithFullRepositoryRuntimeConstraints do
  @moduledoc """
  Provides struct and type for a CodespaceWithFullRepositoryRuntimeConstraints
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          allowed_port_privacy_settings: [String.t()] | nil
        }

  defstruct [:__info__, :__joins__, :allowed_port_privacy_settings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [allowed_port_privacy_settings: [string: :generic]]
  end
end
