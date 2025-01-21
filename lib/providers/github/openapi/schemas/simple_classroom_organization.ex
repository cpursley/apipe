defmodule GitHubOpenAPI.SimpleClassroomOrganization do
  @moduledoc """
  Provides struct and type for a SimpleClassroomOrganization
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          avatar_url: String.t(),
          html_url: String.t(),
          id: integer,
          login: String.t(),
          name: String.t() | nil,
          node_id: String.t()
        }

  defstruct [:__info__, :__joins__, :avatar_url, :html_url, :id, :login, :name, :node_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:string, :generic},
      html_url: {:string, :uri},
      id: :integer,
      login: {:string, :generic},
      name: {:union, [{:string, :generic}, :null]},
      node_id: {:string, :generic}
    ]
  end
end
