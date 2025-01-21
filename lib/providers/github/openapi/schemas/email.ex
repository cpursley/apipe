defmodule GitHubOpenAPI.Email do
  @moduledoc """
  Provides struct and type for a Email
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          email: String.t(),
          primary: boolean,
          verified: boolean,
          visibility: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :email, :primary, :verified, :visibility]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, :email},
      primary: :boolean,
      verified: :boolean,
      visibility: {:union, [{:string, :generic}, :null]}
    ]
  end
end
