defmodule GitHubOpenAPI.ForbiddenGist do
  @moduledoc """
  Provides struct and type for a ForbiddenGist
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type json_resp :: %__MODULE__{
          __info__: map,
          __joins__: map,
          block: GitHubOpenAPI.ForbiddenGistBlock.json_resp() | nil,
          documentation_url: String.t() | nil,
          message: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :block, :documentation_url, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [
      block: {GitHubOpenAPI.ForbiddenGistBlock, :json_resp},
      documentation_url: {:string, :generic},
      message: {:string, :generic}
    ]
  end
end
