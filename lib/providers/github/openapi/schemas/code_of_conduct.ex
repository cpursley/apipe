defmodule GitHubOpenAPI.CodeOfConduct do
  @moduledoc """
  Provides struct and type for a CodeOfConduct
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          body: String.t() | nil,
          html_url: String.t() | nil,
          key: String.t(),
          name: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :body, :html_url, :key, :name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      body: {:string, :generic},
      html_url: {:union, [{:string, :uri}, :null]},
      key: {:string, :generic},
      name: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
