defmodule GitHubOpenAPI.RuleSuiteRuleEvaluations do
  @moduledoc """
  Provides struct and type for a RuleSuiteRuleEvaluations
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          details: String.t() | nil,
          enforcement: String.t() | nil,
          result: String.t() | nil,
          rule_source: GitHubOpenAPI.RuleSuiteRuleEvaluationsRuleSource.t() | nil,
          rule_type: String.t() | nil
        }

  defstruct [:__info__, :details, :enforcement, :result, :rule_source, :rule_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      details: {:union, [{:string, :generic}, :null]},
      enforcement: {:enum, ["active", "evaluate", "deleted ruleset"]},
      result: {:enum, ["pass", "fail"]},
      rule_source: {GitHubOpenAPI.RuleSuiteRuleEvaluationsRuleSource, :t},
      rule_type: {:string, :generic}
    ]
  end
end
