defmodule GitHubOpenAPI.IssuePullRequest do
  @moduledoc """
  Provides struct and type for a IssuePullRequest
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          diff_url: String.t() | nil,
          html_url: String.t() | nil,
          merged_at: DateTime.t() | nil,
          patch_url: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :diff_url, :html_url, :merged_at, :patch_url, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      diff_url: {:string, :uri},
      html_url: {:string, :uri},
      merged_at: {:string, :date_time},
      patch_url: {:string, :uri},
      url: {:string, :uri}
    ]
  end
end
