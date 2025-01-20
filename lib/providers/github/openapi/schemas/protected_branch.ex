defmodule GitHubOpenAPI.ProtectedBranch do
  @moduledoc """
  Provides struct and type for a ProtectedBranch
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          allow_deletions: GitHubOpenAPI.ProtectedBranchAllowDeletions.t() | nil,
          allow_force_pushes: GitHubOpenAPI.ProtectedBranchAllowForcePushes.t() | nil,
          allow_fork_syncing: GitHubOpenAPI.ProtectedBranchAllowForkSyncing.t() | nil,
          block_creations: GitHubOpenAPI.ProtectedBranchBlockCreations.t() | nil,
          enforce_admins: GitHubOpenAPI.ProtectedBranchEnforceAdmins.t() | nil,
          lock_branch: GitHubOpenAPI.ProtectedBranchLockBranch.t() | nil,
          required_conversation_resolution:
            GitHubOpenAPI.ProtectedBranchRequiredConversationResolution.t() | nil,
          required_linear_history: GitHubOpenAPI.ProtectedBranchRequiredLinearHistory.t() | nil,
          required_pull_request_reviews:
            GitHubOpenAPI.ProtectedBranchRequiredPullRequestReviews.t() | nil,
          required_signatures: GitHubOpenAPI.ProtectedBranchRequiredSignatures.t() | nil,
          required_status_checks: GitHubOpenAPI.StatusCheckPolicy.t() | nil,
          restrictions: GitHubOpenAPI.BranchRestrictionPolicy.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :allow_deletions,
    :allow_force_pushes,
    :allow_fork_syncing,
    :block_creations,
    :enforce_admins,
    :lock_branch,
    :required_conversation_resolution,
    :required_linear_history,
    :required_pull_request_reviews,
    :required_signatures,
    :required_status_checks,
    :restrictions,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_deletions: {GitHubOpenAPI.ProtectedBranchAllowDeletions, :t},
      allow_force_pushes: {GitHubOpenAPI.ProtectedBranchAllowForcePushes, :t},
      allow_fork_syncing: {GitHubOpenAPI.ProtectedBranchAllowForkSyncing, :t},
      block_creations: {GitHubOpenAPI.ProtectedBranchBlockCreations, :t},
      enforce_admins: {GitHubOpenAPI.ProtectedBranchEnforceAdmins, :t},
      lock_branch: {GitHubOpenAPI.ProtectedBranchLockBranch, :t},
      required_conversation_resolution:
        {GitHubOpenAPI.ProtectedBranchRequiredConversationResolution, :t},
      required_linear_history: {GitHubOpenAPI.ProtectedBranchRequiredLinearHistory, :t},
      required_pull_request_reviews:
        {GitHubOpenAPI.ProtectedBranchRequiredPullRequestReviews, :t},
      required_signatures: {GitHubOpenAPI.ProtectedBranchRequiredSignatures, :t},
      required_status_checks: {GitHubOpenAPI.StatusCheckPolicy, :t},
      restrictions: {GitHubOpenAPI.BranchRestrictionPolicy, :t},
      url: {:string, :uri}
    ]
  end
end
