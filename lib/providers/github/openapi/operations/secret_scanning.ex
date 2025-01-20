defmodule GitHubOpenAPI.SecretScanning do
  @moduledoc """
  Provides API endpoints related to secret scanning
  """

  @default_client GitHubOpenAPI.Client

  @doc """
  Create a push protection bypass

  Creates a bypass for a previously push protected secret.

  The authenticated user must be the original author of the committed secret.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/secret-scanning/secret-scanning#create-a-push-protection-bypass)

  """
  @spec create_push_protection_bypass(String.t(), String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.SecretScanningPushProtectionBypass.t()}
          | {:error, GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def create_push_protection_bypass(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHubOpenAPI.SecretScanning, :create_push_protection_bypass},
      url: "/repos/#{owner}/#{repo}/secret-scanning/push-protection-bypasses",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.SecretScanningPushProtectionBypass, :t}},
        {403, :null},
        {404, :null},
        {422, :null},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a secret scanning alert

  Gets a single secret scanning alert detected in an eligible repository.

  The authenticated user must be an administrator for the repository or for the organization that owns the repository to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/secret-scanning/secret-scanning#get-a-secret-scanning-alert)

  """
  @spec get_alert(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHubOpenAPI.SecretScanningAlert.t()}
          | {:error, GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def get_alert(owner, repo, alert_number, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, alert_number: alert_number],
      call: {GitHubOpenAPI.SecretScanning, :get_alert},
      url: "/repos/#{owner}/#{repo}/secret-scanning/alerts/#{alert_number}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.SecretScanningAlert, :t}},
        {304, :null},
        {404, :null},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get secret scanning scan history for a repository

  Lists the latest default incremental and backfill scans by type for a repository. Scans from Copilot Secret Scanning are not included.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/secret-scanning/secret-scanning#get-secret-scanning-scan-history-for-a-repository)

  """
  @spec get_scan_history(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.SecretScanningScanHistory.t()}
          | {:error, GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def get_scan_history(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.SecretScanning, :get_scan_history},
      url: "/repos/#{owner}/#{repo}/secret-scanning/scan-history",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.SecretScanningScanHistory, :t}},
        {404, :null},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List secret scanning alerts for an enterprise

  Lists secret scanning alerts for eligible repositories in an enterprise, from newest to oldest.

  Alerts are only returned for organizations in the enterprise for which the authenticated user is an organization owner or a [security manager](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization).

  The authenticated user must be a member of the enterprise in order to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope or `security_events` scope to use this endpoint.

  ## Options

    * `state`: Set to `open` or `resolved` to only list secret scanning alerts in a specific state.
    * `secret_type`: A comma-separated list of secret types to return. All default secret patterns are returned. To return experimental patterns, pass the token name(s) in the parameter. See "[Supported secret scanning patterns](https://docs.github.com/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#supported-secrets)" for a complete list of secret types.
    * `resolution`: A comma-separated list of resolutions. Only secret scanning alerts with one of these resolutions are listed. Valid resolutions are `false_positive`, `wont_fix`, `revoked`, `pattern_edited`, `pattern_deleted` or `used_in_tests`.
    * `sort`: The property to sort the results by. `created` means when the alert was created. `updated` means when the alert was updated or resolved.
    * `direction`: The direction to sort the results by.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `validity`: A comma-separated list of validities that, when present, will return alerts that match the validities in this list. Valid options are `active`, `inactive`, and `unknown`.
    * `is_publicly_leaked`: A boolean value representing whether or not to filter alerts by the publicly-leaked tag being present.
    * `is_multi_repo`: A boolean value representing whether or not to filter alerts by the multi-repo tag being present.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/secret-scanning/secret-scanning#list-secret-scanning-alerts-for-an-enterprise)

  """
  @spec list_alerts_for_enterprise(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.OrganizationSecretScanningAlert.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def list_alerts_for_enterprise(enterprise, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :after,
        :before,
        :direction,
        :is_multi_repo,
        :is_publicly_leaked,
        :per_page,
        :resolution,
        :secret_type,
        :sort,
        :state,
        :validity
      ])

    client.request(%{
      args: [enterprise: enterprise],
      call: {GitHubOpenAPI.SecretScanning, :list_alerts_for_enterprise},
      url: "/enterprises/#{enterprise}/secret-scanning/alerts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.OrganizationSecretScanningAlert, :t}]},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List secret scanning alerts for an organization

  Lists secret scanning alerts for eligible repositories in an organization, from newest to oldest.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Options

    * `state`: Set to `open` or `resolved` to only list secret scanning alerts in a specific state.
    * `secret_type`: A comma-separated list of secret types to return. All default secret patterns are returned. To return experimental patterns, pass the token name(s) in the parameter. See "[Supported secret scanning patterns](https://docs.github.com/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#supported-secrets)" for a complete list of secret types.
    * `resolution`: A comma-separated list of resolutions. Only secret scanning alerts with one of these resolutions are listed. Valid resolutions are `false_positive`, `wont_fix`, `revoked`, `pattern_edited`, `pattern_deleted` or `used_in_tests`.
    * `sort`: The property to sort the results by. `created` means when the alert was created. `updated` means when the alert was updated or resolved.
    * `direction`: The direction to sort the results by.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for events before this cursor. To receive an initial cursor on your first request, include an empty "before" query string.
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for events after this cursor.  To receive an initial cursor on your first request, include an empty "after" query string.
    * `validity`: A comma-separated list of validities that, when present, will return alerts that match the validities in this list. Valid options are `active`, `inactive`, and `unknown`.
    * `is_publicly_leaked`: A boolean value representing whether or not to filter alerts by the publicly-leaked tag being present.
    * `is_multi_repo`: A boolean value representing whether or not to filter alerts by the multi-repo tag being present.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/secret-scanning/secret-scanning#list-secret-scanning-alerts-for-an-organization)

  """
  @spec list_alerts_for_org(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.OrganizationSecretScanningAlert.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def list_alerts_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :after,
        :before,
        :direction,
        :is_multi_repo,
        :is_publicly_leaked,
        :page,
        :per_page,
        :resolution,
        :secret_type,
        :sort,
        :state,
        :validity
      ])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.SecretScanning, :list_alerts_for_org},
      url: "/orgs/#{org}/secret-scanning/alerts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.OrganizationSecretScanningAlert, :t}]},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List secret scanning alerts for a repository

  Lists secret scanning alerts for an eligible repository, from newest to oldest.

  The authenticated user must be an administrator for the repository or for the organization that owns the repository to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Options

    * `state`: Set to `open` or `resolved` to only list secret scanning alerts in a specific state.
    * `secret_type`: A comma-separated list of secret types to return. All default secret patterns are returned. To return experimental patterns, pass the token name(s) in the parameter. See "[Supported secret scanning patterns](https://docs.github.com/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#supported-secrets)" for a complete list of secret types.
    * `resolution`: A comma-separated list of resolutions. Only secret scanning alerts with one of these resolutions are listed. Valid resolutions are `false_positive`, `wont_fix`, `revoked`, `pattern_edited`, `pattern_deleted` or `used_in_tests`.
    * `sort`: The property to sort the results by. `created` means when the alert was created. `updated` means when the alert was updated or resolved.
    * `direction`: The direction to sort the results by.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for events before this cursor. To receive an initial cursor on your first request, include an empty "before" query string.
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for events after this cursor.  To receive an initial cursor on your first request, include an empty "after" query string.
    * `validity`: A comma-separated list of validities that, when present, will return alerts that match the validities in this list. Valid options are `active`, `inactive`, and `unknown`.
    * `is_publicly_leaked`: A boolean value representing whether or not to filter alerts by the publicly-leaked tag being present.
    * `is_multi_repo`: A boolean value representing whether or not to filter alerts by the multi-repo tag being present.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/secret-scanning/secret-scanning#list-secret-scanning-alerts-for-a-repository)

  """
  @spec list_alerts_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.SecretScanningAlert.t()]}
          | {:error, GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def list_alerts_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :after,
        :before,
        :direction,
        :is_multi_repo,
        :is_publicly_leaked,
        :page,
        :per_page,
        :resolution,
        :secret_type,
        :sort,
        :state,
        :validity
      ])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.SecretScanning, :list_alerts_for_repo},
      url: "/repos/#{owner}/#{repo}/secret-scanning/alerts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.SecretScanningAlert, :t}]},
        {404, :null},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List locations for a secret scanning alert

  Lists all locations for a given secret scanning alert for an eligible repository.

  The authenticated user must be an administrator for the repository or for the organization that owns the repository to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Options

    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/secret-scanning/secret-scanning#list-locations-for-a-secret-scanning-alert)

  """
  @spec list_locations_for_alert(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.SecretScanningLocation.t()]}
          | {:error, GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def list_locations_for_alert(owner, repo, alert_number, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo, alert_number: alert_number],
      call: {GitHubOpenAPI.SecretScanning, :list_locations_for_alert},
      url: "/repos/#{owner}/#{repo}/secret-scanning/alerts/#{alert_number}/locations",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.SecretScanningLocation, :t}]},
        {404, :null},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a secret scanning alert

  Updates the status of a secret scanning alert in an eligible repository.

  The authenticated user must be an administrator for the repository or for the organization that owns the repository to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/secret-scanning/secret-scanning#update-a-secret-scanning-alert)

  """
  @spec update_alert(String.t(), String.t(), integer, map, keyword) ::
          {:ok, GitHubOpenAPI.SecretScanningAlert.t()}
          | {:error, GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def update_alert(owner, repo, alert_number, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, alert_number: alert_number, body: body],
      call: {GitHubOpenAPI.SecretScanning, :update_alert},
      url: "/repos/#{owner}/#{repo}/secret-scanning/alerts/#{alert_number}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.SecretScanningAlert, :t}},
        {400, :null},
        {404, :null},
        {422, :null},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end
end
