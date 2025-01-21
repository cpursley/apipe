defmodule GitHubOpenAPI.StateChangeIssueEvent do
  @moduledoc """
  Provides struct and type for a StateChangeIssueEvent
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          actor: GitHubOpenAPI.SimpleUser.t(),
          commit_id: String.t() | nil,
          commit_url: String.t() | nil,
          created_at: String.t(),
          event: String.t(),
          id: integer,
          node_id: String.t(),
          performed_via_github_app: GitHubOpenAPI.Integration.t() | nil,
          state_reason: String.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :actor,
    :commit_id,
    :commit_url,
    :created_at,
    :event,
    :id,
    :node_id,
    :performed_via_github_app,
    :state_reason,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {GitHubOpenAPI.SimpleUser, :t},
      commit_id: {:union, [{:string, :generic}, :null]},
      commit_url: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :generic},
      event: {:string, :generic},
      id: :integer,
      node_id: {:string, :generic},
      performed_via_github_app: {:union, [{GitHubOpenAPI.Integration, :t}, :null]},
      state_reason: {:union, [{:string, :generic}, :null]},
      url: {:string, :generic}
    ]
  end
end
