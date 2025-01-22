defmodule GitHubOpenAPI.RuleSuite do
  @moduledoc """
  Provides struct and type for a RuleSuite
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          actor_id: integer | nil,
          actor_name: String.t() | nil,
          after_sha: String.t() | nil,
          before_sha: String.t() | nil,
          evaluation_result: String.t() | nil,
          id: integer | nil,
          pushed_at: DateTime.t() | nil,
          ref: String.t() | nil,
          repository_id: integer | nil,
          repository_name: String.t() | nil,
          result: String.t() | nil,
          rule_evaluations: [GitHubOpenAPI.RuleSuiteRuleEvaluations.t()] | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :actor_id,
    :actor_name,
    :after_sha,
    :before_sha,
    :evaluation_result,
    :id,
    :pushed_at,
    :ref,
    :repository_id,
    :repository_name,
    :result,
    :rule_evaluations
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor_id: :integer,
      actor_name: {:string, :generic},
      after_sha: {:string, :generic},
      before_sha: {:string, :generic},
      evaluation_result: {:enum, ["pass", "fail", "bypass"]},
      id: :integer,
      pushed_at: {:string, :date_time},
      ref: {:string, :generic},
      repository_id: :integer,
      repository_name: {:string, :generic},
      result: {:enum, ["pass", "fail", "bypass"]},
      rule_evaluations: [{GitHubOpenAPI.RuleSuiteRuleEvaluations, :t}]
    ]
  end
end
