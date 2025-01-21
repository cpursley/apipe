defmodule GitHubOpenAPI.Milestone do
  @moduledoc """
  Provides struct and type for a Milestone
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          closed_at: DateTime.t() | nil,
          closed_issues: integer,
          created_at: DateTime.t(),
          creator: GitHubOpenAPI.SimpleUser.t() | nil,
          description: String.t() | nil,
          due_on: DateTime.t() | nil,
          html_url: String.t(),
          id: integer,
          labels_url: String.t(),
          node_id: String.t(),
          number: integer,
          open_issues: integer,
          state: String.t(),
          title: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :closed_at,
    :closed_issues,
    :created_at,
    :creator,
    :description,
    :due_on,
    :html_url,
    :id,
    :labels_url,
    :node_id,
    :number,
    :open_issues,
    :state,
    :title,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      closed_at: {:union, [{:string, :date_time}, :null]},
      closed_issues: :integer,
      created_at: {:string, :date_time},
      creator: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      description: {:union, [{:string, :generic}, :null]},
      due_on: {:union, [{:string, :date_time}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      labels_url: {:string, :uri},
      node_id: {:string, :generic},
      number: :integer,
      open_issues: :integer,
      state: {:enum, ["open", "closed"]},
      title: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
