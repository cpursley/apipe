defmodule GitHubOpenAPI.ImportProjectChoices do
  @moduledoc """
  Provides struct and type for a ImportProjectChoices
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          human_name: String.t() | nil,
          tfvc_project: String.t() | nil,
          vcs: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :human_name, :tfvc_project, :vcs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [human_name: {:string, :generic}, tfvc_project: {:string, :generic}, vcs: {:string, :generic}]
  end
end
