defmodule GitHubOpenAPI.IntegrationInstallationRequest do
  @moduledoc """
  Provides struct and type for a IntegrationInstallationRequest
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          account: GitHubOpenAPI.Enterprise.t() | GitHubOpenAPI.SimpleUser.t(),
          created_at: DateTime.t(),
          id: integer,
          node_id: String.t() | nil,
          requester: GitHubOpenAPI.SimpleUser.t()
        }

  defstruct [:__info__, :__joins__, :account, :created_at, :id, :node_id, :requester]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      account: {:union, [{GitHubOpenAPI.Enterprise, :t}, {GitHubOpenAPI.SimpleUser, :t}]},
      created_at: {:string, :date_time},
      id: :integer,
      node_id: {:string, :generic},
      requester: {GitHubOpenAPI.SimpleUser, :t}
    ]
  end
end
