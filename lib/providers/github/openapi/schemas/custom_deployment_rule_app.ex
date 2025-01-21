defmodule GitHubOpenAPI.CustomDeploymentRuleApp do
  @moduledoc """
  Provides struct and type for a CustomDeploymentRuleApp
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: integer,
          integration_url: String.t(),
          node_id: String.t(),
          slug: String.t()
        }

  defstruct [:__info__, :__joins__, :id, :integration_url, :node_id, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :integer,
      integration_url: {:string, :generic},
      node_id: {:string, :generic},
      slug: {:string, :generic}
    ]
  end
end
