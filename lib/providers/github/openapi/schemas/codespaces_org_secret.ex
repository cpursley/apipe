defmodule GitHubOpenAPI.CodespacesOrgSecret do
  @moduledoc """
  Provides struct and type for a CodespacesOrgSecret
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: DateTime.t(),
          name: String.t(),
          selected_repositories_url: String.t() | nil,
          updated_at: DateTime.t(),
          visibility: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :created_at,
    :name,
    :selected_repositories_url,
    :updated_at,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      name: {:string, :generic},
      selected_repositories_url: {:string, :uri},
      updated_at: {:string, :date_time},
      visibility: {:enum, ["all", "private", "selected"]}
    ]
  end
end
