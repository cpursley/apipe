defmodule GitHubOpenAPI.CodeScanningAnalysis do
  @moduledoc """
  Provides struct and type for a CodeScanningAnalysis
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          analysis_key: String.t(),
          category: String.t() | nil,
          commit_sha: String.t(),
          created_at: DateTime.t(),
          deletable: boolean,
          environment: String.t(),
          error: String.t(),
          id: integer,
          ref: String.t(),
          results_count: integer,
          rules_count: integer,
          sarif_id: String.t(),
          tool: GitHubOpenAPI.CodeScanningAnalysisTool.t(),
          url: String.t(),
          warning: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :analysis_key,
    :category,
    :commit_sha,
    :created_at,
    :deletable,
    :environment,
    :error,
    :id,
    :ref,
    :results_count,
    :rules_count,
    :sarif_id,
    :tool,
    :url,
    :warning
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      analysis_key: {:string, :generic},
      category: {:string, :generic},
      commit_sha: {:string, :generic},
      created_at: {:string, :date_time},
      deletable: :boolean,
      environment: {:string, :generic},
      error: {:string, :generic},
      id: :integer,
      ref: {:string, :generic},
      results_count: :integer,
      rules_count: :integer,
      sarif_id: {:string, :generic},
      tool: {GitHubOpenAPI.CodeScanningAnalysisTool, :t},
      url: {:string, :uri},
      warning: {:string, :generic}
    ]
  end
end
