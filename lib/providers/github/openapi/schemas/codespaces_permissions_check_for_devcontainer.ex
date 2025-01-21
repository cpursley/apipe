defmodule GitHubOpenAPI.CodespacesPermissionsCheckForDevcontainer do
  @moduledoc """
  Provides struct and type for a CodespacesPermissionsCheckForDevcontainer
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{__info__: map, __joins__: map, accepted: boolean}

  defstruct [:__info__, :__joins__, :accepted]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [accepted: :boolean]
  end
end
