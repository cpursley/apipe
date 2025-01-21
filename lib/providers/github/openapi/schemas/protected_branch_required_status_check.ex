defmodule GitHubOpenAPI.ProtectedBranchRequiredStatusCheck do
  @moduledoc """
  Provides struct and type for a ProtectedBranchRequiredStatusCheck
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          checks: [GitHubOpenAPI.ProtectedBranchRequiredStatusCheckChecks.t()],
          contexts: [String.t()],
          contexts_url: String.t() | nil,
          enforcement_level: String.t() | nil,
          strict: boolean | nil,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :checks,
    :contexts,
    :contexts_url,
    :enforcement_level,
    :strict,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checks: [{GitHubOpenAPI.ProtectedBranchRequiredStatusCheckChecks, :t}],
      contexts: [string: :generic],
      contexts_url: {:string, :generic},
      enforcement_level: {:string, :generic},
      strict: :boolean,
      url: {:string, :generic}
    ]
  end
end
