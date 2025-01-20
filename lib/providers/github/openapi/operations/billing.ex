defmodule GitHubOpenAPI.Billing do
  @moduledoc """
  Provides API endpoints related to billing
  """

  @default_client GitHubOpenAPI.Client

  @doc """
  Get GitHub Actions billing for an organization

  Gets the summary of the free and paid GitHub Actions minutes used.

  Paid minutes only apply to workflows in private repositories that use GitHub-hosted runners. Minutes used is listed for each GitHub-hosted runner operating system. Any job re-runs are also included in the usage. The usage returned includes any minute multipliers for macOS and Windows runners, and is rounded up to the nearest whole minute. For more information, see "[Managing billing for GitHub Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".

  OAuth app tokens and personal access tokens (classic) need the `repo` or `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-github-actions-billing-for-an-organization)

  """
  @spec get_github_actions_billing_org(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.ActionsBillingUsage.t()} | :error
  def get_github_actions_billing_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Billing, :get_github_actions_billing_org},
      url: "/orgs/#{org}/settings/billing/actions",
      method: :get,
      response: [{200, {GitHubOpenAPI.ActionsBillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get GitHub Actions billing for a user

  Gets the summary of the free and paid GitHub Actions minutes used.

  Paid minutes only apply to workflows in private repositories that use GitHub-hosted runners. Minutes used is listed for each GitHub-hosted runner operating system. Any job re-runs are also included in the usage. The usage returned includes any minute multipliers for macOS and Windows runners, and is rounded up to the nearest whole minute. For more information, see "[Managing billing for GitHub Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-github-actions-billing-for-a-user)

  """
  @spec get_github_actions_billing_user(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.ActionsBillingUsage.t()} | :error
  def get_github_actions_billing_user(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Billing, :get_github_actions_billing_user},
      url: "/users/#{username}/settings/billing/actions",
      method: :get,
      response: [{200, {GitHubOpenAPI.ActionsBillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get billing usage report for an organization

  Gets a report of the total usage for an organization. To use this endpoint, you must be an administrator of an organization within an enterprise or an organization account.

  **Note:** This endpoint is only available to organizations with access to the enhanced billing platform. For more information, see "[About the enhanced billing platform](https://docs.github.com/billing/using-the-new-billing-platform)."

  ## Options

    * `year`: If specified, only return results for a single year. The value of `year` is an integer with four digits representing a year. For example, `2024`. Default value is the current year.
    * `month`: If specified, only return results for a single month. The value of `month` is an integer between `1` and `12`.
    * `day`: If specified, only return results for a single day. The value of `day` is an integer between `1` and `31`.
    * `hour`: If specified, only return results for a single hour. The value of `hour` is an integer between `0` and `23`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/enhanced-billing#get-billing-usage-report-for-an-organization)

  """
  @spec get_github_billing_usage_report_org(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.BillingUsageReport.t()}
          | {:error,
             GitHubOpenAPI.BasicError.t()
             | GitHubOpenAPI.ScimError.t()
             | GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def get_github_billing_usage_report_org(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:day, :hour, :month, :year])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Billing, :get_github_billing_usage_report_org},
      url: "/organizations/#{org}/settings/billing/usage",
      method: :get,
      query: query,
      response: [
        {200, {GitHubOpenAPI.BillingUsageReport, :t}},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get GitHub Packages billing for an organization

  Gets the free and paid storage used for GitHub Packages in gigabytes.

  Paid minutes only apply to packages stored for private repositories. For more information, see "[Managing billing for GitHub Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."

  OAuth app tokens and personal access tokens (classic) need the `repo` or `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-github-packages-billing-for-an-organization)

  """
  @spec get_github_packages_billing_org(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.PackagesBillingUsage.t()} | :error
  def get_github_packages_billing_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Billing, :get_github_packages_billing_org},
      url: "/orgs/#{org}/settings/billing/packages",
      method: :get,
      response: [{200, {GitHubOpenAPI.PackagesBillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get GitHub Packages billing for a user

  Gets the free and paid storage used for GitHub Packages in gigabytes.

  Paid minutes only apply to packages stored for private repositories. For more information, see "[Managing billing for GitHub Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-github-packages-billing-for-a-user)

  """
  @spec get_github_packages_billing_user(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.PackagesBillingUsage.t()} | :error
  def get_github_packages_billing_user(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Billing, :get_github_packages_billing_user},
      url: "/users/#{username}/settings/billing/packages",
      method: :get,
      response: [{200, {GitHubOpenAPI.PackagesBillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get shared storage billing for an organization

  Gets the estimated paid and estimated total storage used for GitHub Actions and GitHub Packages.

  Paid minutes only apply to packages stored for private repositories. For more information, see "[Managing billing for GitHub Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."

  OAuth app tokens and personal access tokens (classic) need the `repo` or `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-shared-storage-billing-for-an-organization)

  """
  @spec get_shared_storage_billing_org(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.CombinedBillingUsage.t()} | :error
  def get_shared_storage_billing_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Billing, :get_shared_storage_billing_org},
      url: "/orgs/#{org}/settings/billing/shared-storage",
      method: :get,
      response: [{200, {GitHubOpenAPI.CombinedBillingUsage, :t}}],
      opts: opts
    })
  end

  @doc """
  Get shared storage billing for a user

  Gets the estimated paid and estimated total storage used for GitHub Actions and GitHub Packages.

  Paid minutes only apply to packages stored for private repositories. For more information, see "[Managing billing for GitHub Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/billing/billing#get-shared-storage-billing-for-a-user)

  """
  @spec get_shared_storage_billing_user(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.CombinedBillingUsage.t()} | :error
  def get_shared_storage_billing_user(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Billing, :get_shared_storage_billing_user},
      url: "/users/#{username}/settings/billing/shared-storage",
      method: :get,
      response: [{200, {GitHubOpenAPI.CombinedBillingUsage, :t}}],
      opts: opts
    })
  end
end
