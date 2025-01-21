defmodule GitHubOpenAPI.BranchProtection do
  @moduledoc """
  Provides struct and type for a BranchProtection
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          allow_deletions: GitHubOpenAPI.BranchProtectionAllowDeletions.t() | nil,
          allow_force_pushes: GitHubOpenAPI.BranchProtectionAllowForcePushes.t() | nil,
          allow_fork_syncing: GitHubOpenAPI.BranchProtectionAllowForkSyncing.t() | nil,
          block_creations: GitHubOpenAPI.BranchProtectionBlockCreations.t() | nil,
          enabled: boolean | nil,
          enforce_admins: GitHubOpenAPI.ProtectedBranchAdminEnforced.t() | nil,
          lock_branch: GitHubOpenAPI.BranchProtectionLockBranch.t() | nil,
          name: String.t() | nil,
          protection_url: String.t() | nil,
          required_conversation_resolution:
            GitHubOpenAPI.BranchProtectionRequiredConversationResolution.t() | nil,
          required_linear_history: GitHubOpenAPI.BranchProtectionRequiredLinearHistory.t() | nil,
          required_pull_request_reviews: GitHubOpenAPI.ProtectedBranchPullRequestReview.t() | nil,
          required_signatures: GitHubOpenAPI.BranchProtectionRequiredSignatures.t() | nil,
          required_status_checks: GitHubOpenAPI.ProtectedBranchRequiredStatusCheck.t() | nil,
          restrictions: GitHubOpenAPI.BranchRestrictionPolicy.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :allow_deletions,
    :allow_force_pushes,
    :allow_fork_syncing,
    :block_creations,
    :enabled,
    :enforce_admins,
    :lock_branch,
    :name,
    :protection_url,
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
      allow_deletions: {GitHubOpenAPI.BranchProtectionAllowDeletions, :t},
      allow_force_pushes: {GitHubOpenAPI.BranchProtectionAllowForcePushes, :t},
      allow_fork_syncing: {GitHubOpenAPI.BranchProtectionAllowForkSyncing, :t},
      block_creations: {GitHubOpenAPI.BranchProtectionBlockCreations, :t},
      enabled: :boolean,
      enforce_admins: {GitHubOpenAPI.ProtectedBranchAdminEnforced, :t},
      lock_branch: {GitHubOpenAPI.BranchProtectionLockBranch, :t},
      name: {:string, :generic},
      protection_url: {:string, :generic},
      required_conversation_resolution:
        {GitHubOpenAPI.BranchProtectionRequiredConversationResolution, :t},
      required_linear_history: {GitHubOpenAPI.BranchProtectionRequiredLinearHistory, :t},
      required_pull_request_reviews: {GitHubOpenAPI.ProtectedBranchPullRequestReview, :t},
      required_signatures: {GitHubOpenAPI.BranchProtectionRequiredSignatures, :t},
      required_status_checks: {GitHubOpenAPI.ProtectedBranchRequiredStatusCheck, :t},
      restrictions: {GitHubOpenAPI.BranchRestrictionPolicy, :t},
      url: {:string, :generic}
    ]
  end
end
