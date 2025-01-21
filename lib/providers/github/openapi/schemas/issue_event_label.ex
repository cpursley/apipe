defmodule GitHubOpenAPI.IssueEventLabel do
  @moduledoc """
  Provides struct and type for a IssueEventLabel
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          color: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :color, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [color: {:union, [{:string, :generic}, :null]}, name: {:union, [{:string, :generic}, :null]}]
  end
end
