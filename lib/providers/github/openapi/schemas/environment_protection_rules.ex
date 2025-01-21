defmodule GitHubOpenAPI.EnvironmentProtectionRules do
  @moduledoc """
  Provides struct and types for a EnvironmentProtectionRules
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          id: integer,
          node_id: String.t(),
          prevent_self_review: boolean | nil,
          reviewers: [GitHubOpenAPI.EnvironmentProtectionRulesReviewers.t()] | nil,
          type: String.t(),
          wait_timer: integer | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :id,
    :node_id,
    :prevent_self_review,
    :reviewers,
    :type,
    :wait_timer
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :integer,
      node_id: {:string, :generic},
      prevent_self_review: :boolean,
      reviewers: [{GitHubOpenAPI.EnvironmentProtectionRulesReviewers, :t}],
      type: {:string, :generic},
      wait_timer: :integer
    ]
  end
end
