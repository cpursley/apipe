defmodule GitHubOpenAPI.CodeScanningDefaultSetup do
  @moduledoc """
  Provides struct and type for a CodeScanningDefaultSetup
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          languages: [String.t()] | nil,
          query_suite: String.t() | nil,
          runner_label: String.t() | nil,
          runner_type: String.t() | nil,
          schedule: String.t() | nil,
          state: String.t() | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :languages,
    :query_suite,
    :runner_label,
    :runner_type,
    :schedule,
    :state,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      languages: [
        enum: [
          "actions",
          "c-cpp",
          "csharp",
          "go",
          "java-kotlin",
          "javascript-typescript",
          "javascript",
          "python",
          "ruby",
          "typescript",
          "swift"
        ]
      ],
      query_suite: {:enum, ["default", "extended"]},
      runner_label: {:union, [{:string, :generic}, :null]},
      runner_type: {:enum, ["standard", "labeled", nil]},
      schedule: {:enum, ["weekly", nil]},
      state: {:enum, ["configured", "not-configured"]},
      updated_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
