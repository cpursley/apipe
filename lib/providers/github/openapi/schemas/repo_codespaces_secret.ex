defmodule GitHubOpenAPI.RepoCodespacesSecret do
  @moduledoc """
  Provides struct and type for a RepoCodespacesSecret
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t(),
          name: String.t(),
          updated_at: DateTime.t()
        }

  defstruct [:__info__, :__joins__, :created_at, :name, :updated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      name: {:string, :generic},
      updated_at: {:string, :date_time}
    ]
  end
end
