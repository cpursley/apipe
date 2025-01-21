defmodule GitHubOpenAPI.StatusCheckPolicy do
  @moduledoc """
  Provides struct and type for a StatusCheckPolicy
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          checks: [GitHubOpenAPI.StatusCheckPolicyChecks.t()],
          contexts: [String.t()],
          contexts_url: String.t(),
          strict: boolean,
          url: String.t()
        }

  defstruct [:__info__, :__joins__, :checks, :contexts, :contexts_url, :strict, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checks: [{GitHubOpenAPI.StatusCheckPolicyChecks, :t}],
      contexts: [string: :generic],
      contexts_url: {:string, :uri},
      strict: :boolean,
      url: {:string, :uri}
    ]
  end
end
