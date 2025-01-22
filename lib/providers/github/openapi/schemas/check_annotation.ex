defmodule GitHubOpenAPI.CheckAnnotation do
  @moduledoc """
  Provides struct and type for a CheckAnnotation
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          annotation_level: String.t() | nil,
          blob_href: String.t(),
          end_column: integer | nil,
          end_line: integer,
          message: String.t() | nil,
          path: String.t(),
          raw_details: String.t() | nil,
          start_column: integer | nil,
          start_line: integer,
          title: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :annotation_level,
    :blob_href,
    :end_column,
    :end_line,
    :message,
    :path,
    :raw_details,
    :start_column,
    :start_line,
    :title
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotation_level: {:string, :generic},
      blob_href: {:string, :generic},
      end_column: :integer,
      end_line: :integer,
      message: {:string, :generic},
      path: {:string, :generic},
      raw_details: {:string, :generic},
      start_column: :integer,
      start_line: :integer,
      title: {:string, :generic}
    ]
  end
end
