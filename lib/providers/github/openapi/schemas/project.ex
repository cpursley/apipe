defmodule GitHubOpenAPI.Project do
  @moduledoc """
  Provides struct and type for a Project
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          body: String.t() | nil,
          columns_url: String.t(),
          created_at: DateTime.t(),
          creator: GitHubOpenAPI.NullableSimpleUser.t(),
          html_url: String.t(),
          id: integer,
          name: String.t(),
          node_id: String.t(),
          number: integer,
          organization_permission: String.t() | nil,
          owner_url: String.t(),
          private: boolean | nil,
          state: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :body,
    :columns_url,
    :created_at,
    :creator,
    :html_url,
    :id,
    :name,
    :node_id,
    :number,
    :organization_permission,
    :owner_url,
    :private,
    :state,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      body: {:string, :generic},
      columns_url: {:string, :uri},
      created_at: {:string, :date_time},
      creator: {GitHubOpenAPI.NullableSimpleUser, :t},
      html_url: {:string, :uri},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      number: :integer,
      organization_permission: {:enum, ["read", "write", "admin", "none"]},
      owner_url: {:string, :uri},
      private: :boolean,
      state: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
