defmodule GitHubOpenAPI.EventPayload do
  @moduledoc """
  Provides struct and type for a EventPayload
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          action: String.t() | nil,
          comment: GitHubOpenAPI.IssueComment.t() | nil,
          issue: GitHubOpenAPI.Issue.t() | nil,
          pages: [GitHubOpenAPI.EventPayloadPages.t()] | nil
        }

  defstruct [:__info__, :__joins__, :action, :comment, :issue, :pages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: {:string, :generic},
      comment: {GitHubOpenAPI.IssueComment, :t},
      issue: {GitHubOpenAPI.Issue, :t},
      pages: [{GitHubOpenAPI.EventPayloadPages, :t}]
    ]
  end
end
