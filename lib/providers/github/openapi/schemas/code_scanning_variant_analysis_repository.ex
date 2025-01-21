defmodule GitHubOpenAPI.CodeScanningVariantAnalysisRepository do
  @moduledoc """
  Provides struct and type for a CodeScanningVariantAnalysisRepository
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          full_name: String.t(),
          id: integer,
          name: String.t(),
          private: boolean,
          stargazers_count: integer,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :full_name,
    :id,
    :name,
    :private,
    :stargazers_count,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      full_name: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      private: :boolean,
      stargazers_count: :integer,
      updated_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
