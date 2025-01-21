defmodule GitHubOpenAPI.MergedUpstream do
  @moduledoc """
  Provides struct and type for a MergedUpstream
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          base_branch: String.t() | nil,
          merge_type: String.t() | nil,
          message: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :base_branch, :merge_type, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      base_branch: {:string, :generic},
      merge_type: {:enum, ["merge", "fast-forward", "none"]},
      message: {:string, :generic}
    ]
  end
end
