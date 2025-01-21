defmodule GitHubOpenAPI.Emojis do
  @moduledoc """
  Provides API endpoint related to emojis
  """

  @default_client GitHubOpenAPI.Client

  @type get_200_json_resp :: %{__info__: map, __joins__: map}

  @doc """
  Get emojis

  Lists all the emojis available to use on GitHub.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/emojis/emojis#get-emojis)

  """
  @spec get(keyword) :: {:ok, map} | :error
  def get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Emojis, :get},
      url: "/emojis",
      method: :get,
      response: [{200, {GitHubOpenAPI.Emojis, :get_200_json_resp}}, {304, :null}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_200_json_resp) do
    []
  end
end
