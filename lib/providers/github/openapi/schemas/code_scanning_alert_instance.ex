defmodule GitHubOpenAPI.CodeScanningAlertInstance do
  @moduledoc """
  Provides struct and type for a CodeScanningAlertInstance
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          analysis_key: String.t() | nil,
          category: String.t() | nil,
          classifications: [String.t() | nil] | nil,
          commit_sha: String.t() | nil,
          environment: String.t() | nil,
          html_url: String.t() | nil,
          location: GitHubOpenAPI.CodeScanningAlertLocation.t() | nil,
          message: GitHubOpenAPI.CodeScanningAlertInstanceMessage.t() | nil,
          ref: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :analysis_key,
    :category,
    :classifications,
    :commit_sha,
    :environment,
    :html_url,
    :location,
    :message,
    :ref,
    :state
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      analysis_key: {:string, :generic},
      category: {:string, :generic},
      classifications: [enum: ["source", "generated", "test", "library", nil]],
      commit_sha: {:string, :generic},
      environment: {:string, :generic},
      html_url: {:string, :generic},
      location: {GitHubOpenAPI.CodeScanningAlertLocation, :t},
      message: {GitHubOpenAPI.CodeScanningAlertInstanceMessage, :t},
      ref: {:string, :generic},
      state: {:enum, ["open", "dismissed", "fixed", nil]}
    ]
  end
end
