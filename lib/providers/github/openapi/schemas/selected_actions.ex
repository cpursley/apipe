defmodule GitHubOpenAPI.SelectedActions do
  @moduledoc """
  Provides struct and type for a SelectedActions
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          github_owned_allowed: boolean | nil,
          patterns_allowed: [String.t()] | nil,
          verified_allowed: boolean | nil
        }

  defstruct [:__info__, :__joins__, :github_owned_allowed, :patterns_allowed, :verified_allowed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      github_owned_allowed: :boolean,
      patterns_allowed: [string: :generic],
      verified_allowed: :boolean
    ]
  end
end
