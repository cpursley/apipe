defmodule GitHubOpenAPI.RepositoryRuleset do
  @moduledoc """
  Provides struct and type for a RepositoryRuleset
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          _links: GitHubOpenAPI.RepositoryRulesetLinks.t() | nil,
          bypass_actors: [GitHubOpenAPI.RepositoryRulesetBypassActor.t()] | nil,
          conditions:
            GitHubOpenAPI.RepositoryIdAndRefName.t()
            | GitHubOpenAPI.RepositoryNameAndRefName.t()
            | GitHubOpenAPI.RepositoryPropertyAndRefName.t()
            | GitHubOpenAPI.RepositoryRulesetConditions.t()
            | nil,
          created_at: DateTime.t() | nil,
          current_user_can_bypass: String.t() | nil,
          enforcement: String.t(),
          id: integer,
          name: String.t(),
          node_id: String.t() | nil,
          rules:
            [
              GitHubOpenAPI.FileExtensionRestriction.t()
              | GitHubOpenAPI.FilePathRestriction.t()
              | GitHubOpenAPI.MaxFilePathLength.t()
              | GitHubOpenAPI.MaxFileSize.t()
              | GitHubOpenAPI.RepositoryRuleBranchNamePattern.t()
              | GitHubOpenAPI.RepositoryRuleCodeScanning.t()
              | GitHubOpenAPI.RepositoryRuleCommitAuthorEmailPattern.t()
              | GitHubOpenAPI.RepositoryRuleCommitMessagePattern.t()
              | GitHubOpenAPI.RepositoryRuleCommitterEmailPattern.t()
              | GitHubOpenAPI.RepositoryRuleCreation.t()
              | GitHubOpenAPI.RepositoryRuleDeletion.t()
              | GitHubOpenAPI.RepositoryRuleMergeQueue.t()
              | GitHubOpenAPI.RepositoryRuleNonFastForward.t()
              | GitHubOpenAPI.RepositoryRulePullRequest.t()
              | GitHubOpenAPI.RepositoryRuleRequiredDeployments.t()
              | GitHubOpenAPI.RepositoryRuleRequiredLinearHistory.t()
              | GitHubOpenAPI.RepositoryRuleRequiredSignatures.t()
              | GitHubOpenAPI.RepositoryRuleRequiredStatusChecks.t()
              | GitHubOpenAPI.RepositoryRuleTagNamePattern.t()
              | GitHubOpenAPI.RepositoryRuleUpdate.t()
              | GitHubOpenAPI.RepositoryRuleWorkflows.t()
            ]
            | nil,
          source: String.t(),
          source_type: String.t() | nil,
          target: String.t() | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :__joins__,
    :_links,
    :bypass_actors,
    :conditions,
    :created_at,
    :current_user_can_bypass,
    :enforcement,
    :id,
    :name,
    :node_id,
    :rules,
    :source,
    :source_type,
    :target,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHubOpenAPI.RepositoryRulesetLinks, :t},
      bypass_actors: [{GitHubOpenAPI.RepositoryRulesetBypassActor, :t}],
      conditions:
        {:union,
         [
           {GitHubOpenAPI.RepositoryIdAndRefName, :t},
           {GitHubOpenAPI.RepositoryNameAndRefName, :t},
           {GitHubOpenAPI.RepositoryPropertyAndRefName, :t},
           {GitHubOpenAPI.RepositoryRulesetConditions, :t}
         ]},
      created_at: {:string, :date_time},
      current_user_can_bypass: {:enum, ["always", "pull_requests_only", "never"]},
      enforcement: {:enum, ["disabled", "active", "evaluate"]},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      rules: [
        union: [
          {GitHubOpenAPI.FileExtensionRestriction, :t},
          {GitHubOpenAPI.FilePathRestriction, :t},
          {GitHubOpenAPI.MaxFilePathLength, :t},
          {GitHubOpenAPI.MaxFileSize, :t},
          {GitHubOpenAPI.RepositoryRuleBranchNamePattern, :t},
          {GitHubOpenAPI.RepositoryRuleCodeScanning, :t},
          {GitHubOpenAPI.RepositoryRuleCommitAuthorEmailPattern, :t},
          {GitHubOpenAPI.RepositoryRuleCommitMessagePattern, :t},
          {GitHubOpenAPI.RepositoryRuleCommitterEmailPattern, :t},
          {GitHubOpenAPI.RepositoryRuleCreation, :t},
          {GitHubOpenAPI.RepositoryRuleDeletion, :t},
          {GitHubOpenAPI.RepositoryRuleMergeQueue, :t},
          {GitHubOpenAPI.RepositoryRuleNonFastForward, :t},
          {GitHubOpenAPI.RepositoryRulePullRequest, :t},
          {GitHubOpenAPI.RepositoryRuleRequiredDeployments, :t},
          {GitHubOpenAPI.RepositoryRuleRequiredLinearHistory, :t},
          {GitHubOpenAPI.RepositoryRuleRequiredSignatures, :t},
          {GitHubOpenAPI.RepositoryRuleRequiredStatusChecks, :t},
          {GitHubOpenAPI.RepositoryRuleTagNamePattern, :t},
          {GitHubOpenAPI.RepositoryRuleUpdate, :t},
          {GitHubOpenAPI.RepositoryRuleWorkflows, :t}
        ]
      ],
      source: {:string, :generic},
      source_type: {:enum, ["Repository", "Organization", "Enterprise"]},
      target: {:enum, ["branch", "tag", "push", "repository"]},
      updated_at: {:string, :date_time}
    ]
  end
end
