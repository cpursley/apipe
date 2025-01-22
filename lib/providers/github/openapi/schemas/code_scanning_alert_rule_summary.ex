defmodule GitHubOpenAPI.CodeScanningAlertRuleSummary do
  @moduledoc """
  Provides struct and type for a CodeScanningAlertRuleSummary
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          description: String.t() | nil,
          full_description: String.t() | nil,
          help: String.t() | nil,
          help_uri: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          security_severity_level: String.t() | nil,
          severity: String.t() | nil,
          tags: [String.t()] | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :description,
    :full_description,
    :help,
    :help_uri,
    :id,
    :name,
    :security_severity_level,
    :severity,
    :tags
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      full_description: {:string, :generic},
      help: {:string, :generic},
      help_uri: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      security_severity_level: {:enum, ["low", "medium", "high", "critical"]},
      severity: {:enum, ["none", "note", "warning", "error"]},
      tags: [string: :generic]
    ]
  end
end
