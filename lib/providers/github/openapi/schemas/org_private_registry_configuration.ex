defmodule GitHubOpenAPI.OrgPrivateRegistryConfiguration do
  @moduledoc """
  Provides struct and type for a OrgPrivateRegistryConfiguration
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t(),
          name: String.t(),
          registry_type: String.t(),
          updated_at: DateTime.t(),
          username: String.t() | nil,
          visibility: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :created_at,
    :name,
    :registry_type,
    :updated_at,
    :username,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      name: {:string, :generic},
      registry_type: {:const, "maven_repository"},
      updated_at: {:string, :date_time},
      username: {:string, :generic},
      visibility: {:enum, ["all", "private", "selected"]}
    ]
  end
end
