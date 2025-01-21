defmodule GitHubOpenAPI.PullRequestLabels do
  @moduledoc """
  Provides struct and type for a PullRequestLabels
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          color: String.t(),
          default: boolean,
          description: String.t() | nil,
          id: integer,
          name: String.t(),
          node_id: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :color, :default, :description, :id, :name, :node_id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      color: {:string, :generic},
      default: :boolean,
      description: {:union, [{:string, :generic}, :null]},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
