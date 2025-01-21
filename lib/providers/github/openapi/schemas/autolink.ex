defmodule GitHubOpenAPI.Autolink do
  @moduledoc """
  Provides struct and type for a Autolink
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: integer,
          is_alphanumeric: boolean,
          key_prefix: String.t(),
          url_template: String.t()
        }

  defstruct [:__info__, :__joins__, :id, :is_alphanumeric, :key_prefix, :url_template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :integer,
      is_alphanumeric: :boolean,
      key_prefix: {:string, :generic},
      url_template: {:string, :generic}
    ]
  end
end
