defmodule GitHubOpenAPI.CodeScanningAutofixCommitsResponse do
  @moduledoc """
  Provides struct and type for a CodeScanningAutofixCommitsResponse
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{__info__: map, sha: String.t() | nil, target_ref: String.t() | nil}

  defstruct [:__info__, :sha, :target_ref]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [sha: {:string, :generic}, target_ref: {:string, :generic}]
  end
end
