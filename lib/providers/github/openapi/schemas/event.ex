defmodule GitHubOpenAPI.Event do
  @moduledoc """
  Provides struct and type for a Event
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          actor: GitHubOpenAPI.Actor.t(),
          created_at: DateTime.t() | nil,
          id: String.t(),
          org: GitHubOpenAPI.Actor.t() | nil,
          payload: GitHubOpenAPI.EventPayload.t(),
          public: boolean,
          repo: GitHubOpenAPI.EventRepo.t(),
          type: String.t() | nil
        }

  defstruct [:__info__, :actor, :created_at, :id, :org, :payload, :public, :repo, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {GitHubOpenAPI.Actor, :t},
      created_at: {:union, [{:string, :date_time}, :null]},
      id: {:string, :generic},
      org: {GitHubOpenAPI.Actor, :t},
      payload: {GitHubOpenAPI.EventPayload, :t},
      public: :boolean,
      repo: {GitHubOpenAPI.EventRepo, :t},
      type: {:union, [{:string, :generic}, :null]}
    ]
  end
end
