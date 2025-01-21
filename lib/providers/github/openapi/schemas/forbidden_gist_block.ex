defmodule GitHubOpenAPI.ForbiddenGistBlock do
  @moduledoc """
  Provides struct and type for a ForbiddenGistBlock
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type json_resp :: %__MODULE__{
          __info__: map,
          __joins__: map,
          created_at: String.t() | nil,
          html_url: String.t() | nil,
          reason: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :created_at, :html_url, :reason]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [
      created_at: {:string, :generic},
      html_url: {:union, [{:string, :generic}, :null]},
      reason: {:string, :generic}
    ]
  end
end
