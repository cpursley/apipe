defmodule GitHubOpenAPI.DependabotAlertWithRepositoryDependency do
  @moduledoc """
  Provides struct and type for a DependabotAlertWithRepositoryDependency
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          manifest_path: String.t() | nil,
          package: GitHubOpenAPI.DependabotAlertPackage.t() | nil,
          scope: String.t() | nil
        }

  defstruct [:__info__, :__joins__, :manifest_path, :package, :scope]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      manifest_path: {:string, :generic},
      package: {GitHubOpenAPI.DependabotAlertPackage, :t},
      scope: {:enum, ["development", "runtime"]}
    ]
  end
end
