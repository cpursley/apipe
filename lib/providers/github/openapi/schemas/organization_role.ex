defmodule GitHubOpenAPI.OrganizationRole do
  @moduledoc """
  Provides struct and type for a OrganizationRole
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          base_role: String.t() | nil,
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: integer,
          name: String.t(),
          organization: GitHubOpenAPI.SimpleUser.t() | nil,
          permissions: [String.t()],
          source: String.t() | nil,
          updated_at: DateTime.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :base_role,
    :created_at,
    :description,
    :id,
    :name,
    :organization,
    :permissions,
    :source,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      base_role: {:enum, ["read", "triage", "write", "maintain", "admin", nil]},
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      id: :integer,
      name: {:string, :generic},
      organization: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      permissions: [string: :generic],
      source: {:enum, ["Organization", "Enterprise", "Predefined", nil]},
      updated_at: {:string, :date_time}
    ]
  end
end
