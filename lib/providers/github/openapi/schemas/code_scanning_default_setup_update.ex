defmodule GitHubOpenAPI.CodeScanningDefaultSetupUpdate do
  @moduledoc """
  Provides struct and type for a CodeScanningDefaultSetupUpdate
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          languages: [String.t()] | nil,
          query_suite: String.t() | nil,
          runner_label: String.t() | nil,
          runner_type: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :languages, :query_suite, :runner_label, :runner_type, :state]

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
          "python",
          "ruby",
          "swift"
        ]
      ],
      query_suite: {:enum, ["default", "extended"]},
      runner_label: {:union, [{:string, :generic}, :null]},
      runner_type: {:enum, ["standard", "labeled"]},
      state: {:enum, ["configured", "not-configured"]}
    ]
  end
end
