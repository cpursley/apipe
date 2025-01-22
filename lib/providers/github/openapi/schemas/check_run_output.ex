defmodule GitHubOpenAPI.CheckRunOutput do
  @moduledoc """
  Provides struct and type for a CheckRunOutput
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          annotations_count: integer,
          annotations_url: String.t(),
          summary: String.t() | nil,
          text: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :annotations_count, :annotations_url, :summary, :text, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations_count: :integer,
      annotations_url: {:string, :uri},
      summary: {:string, :generic},
      text: {:string, :generic},
      title: {:string, :generic}
    ]
  end
end
