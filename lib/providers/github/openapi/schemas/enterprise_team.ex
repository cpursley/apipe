defmodule GitHubOpenAPI.EnterpriseTeam do
  @moduledoc """
  Provides struct and type for a EnterpriseTeam
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t(),
          group_id: String.t() | nil,
          group_name: String.t() | nil,
          html_url: String.t(),
          id: integer,
          members_url: String.t(),
          name: String.t(),
          slug: String.t(),
          sync_to_organizations: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :created_at,
    :group_id,
    :group_name,
    :html_url,
    :id,
    :members_url,
    :name,
    :slug,
    :sync_to_organizations,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      group_id: {:union, [{:string, :generic}, :null]},
      group_name: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      members_url: {:string, :generic},
      name: {:string, :generic},
      slug: {:string, :generic},
      sync_to_organizations: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
