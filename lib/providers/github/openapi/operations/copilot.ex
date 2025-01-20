defmodule GitHubOpenAPI.Copilot do
  @moduledoc """
  Provides API endpoints related to copilot
  """

  @default_client GitHubOpenAPI.Client

  @type add_copilot_seats_for_teams_201_json_resp :: %{__info__: map, seats_created: integer}

  @doc """
  Add teams to the Copilot subscription for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Purchases a GitHub Copilot seat for all users within each specified team.
  The organization will be billed for each seat based on the organization's Copilot plan. For more information about Copilot pricing, see "[About billing for GitHub Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/about-billing-for-github-copilot-in-your-organization)."

  Only organization owners can purchase Copilot seats for their organization members. The organization must have a Copilot Business or Copilot Enterprise subscription and a configured suggestion matching policy.
  For more information about setting up a Copilot subscription, see "[Subscribing to Copilot for your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/subscribing-to-copilot-for-your-organization)."
  For more information about setting a suggestion matching policy, see "[Managing policies for Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/setting-policies-for-copilot-in-your-organization/managing-policies-for-copilot-in-your-organization#policies-for-suggestion-matching)."

  The response contains the total number of new seats that were created and existing seats that were refreshed.

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `admin:org` scopes to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-user-management#add-teams-to-the-copilot-subscription-for-an-organization)

  """
  @spec add_copilot_seats_for_teams(String.t(), map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def add_copilot_seats_for_teams(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Copilot, :add_copilot_seats_for_teams},
      url: "/orgs/#{org}/copilot/billing/selected_teams",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHubOpenAPI.Copilot, :add_copilot_seats_for_teams_201_json_resp}},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, :null},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type add_copilot_seats_for_users_201_json_resp :: %{__info__: map, seats_created: integer}

  @doc """
  Add users to the Copilot subscription for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Purchases a GitHub Copilot seat for each user specified.
  The organization will be billed for each seat based on the organization's Copilot plan. For more information about Copilot pricing, see "[About billing for GitHub Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/about-billing-for-github-copilot-in-your-organization)."

  Only organization owners can purchase Copilot seats for their organization members. The organization must have a Copilot Business or Copilot Enterprise subscription and a configured suggestion matching policy.
  For more information about setting up a Copilot subscription, see "[Subscribing to Copilot for your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/subscribing-to-copilot-for-your-organization)."
  For more information about setting a suggestion matching policy, see "[Managing policies for Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/setting-policies-for-copilot-in-your-organization/managing-policies-for-copilot-in-your-organization#policies-for-suggestion-matching)."

  The response contains the total number of new seats that were created and existing seats that were refreshed.

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `admin:org` scopes to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-user-management#add-users-to-the-copilot-subscription-for-an-organization)

  """
  @spec add_copilot_seats_for_users(String.t(), map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def add_copilot_seats_for_users(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Copilot, :add_copilot_seats_for_users},
      url: "/orgs/#{org}/copilot/billing/selected_users",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHubOpenAPI.Copilot, :add_copilot_seats_for_users_201_json_resp}},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, :null},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type cancel_copilot_seat_assignment_for_teams_200_json_resp :: %{
          __info__: map,
          seats_cancelled: integer
        }

  @doc """
  Remove teams from the Copilot subscription for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Sets seats for all members of each team specified to "pending cancellation".
  This will cause the members of the specified team(s) to lose access to GitHub Copilot at the end of the current billing cycle unless they retain access through another team.
  For more information about disabling access to Copilot, see "[Revoking access to Copilot for members of your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-access-to-github-copilot-in-your-organization/revoking-access-to-copilot-for-members-of-your-organization)."

  Only organization owners can cancel Copilot seats for their organization members.

  The response contains the total number of seats set to "pending cancellation".

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `admin:org` scopes to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-user-management#remove-teams-from-the-copilot-subscription-for-an-organization)

  """
  @spec cancel_copilot_seat_assignment_for_teams(String.t(), map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def cancel_copilot_seat_assignment_for_teams(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Copilot, :cancel_copilot_seat_assignment_for_teams},
      url: "/orgs/#{org}/copilot/billing/selected_teams",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.Copilot, :cancel_copilot_seat_assignment_for_teams_200_json_resp}},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, :null},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type cancel_copilot_seat_assignment_for_users_200_json_resp :: %{
          __info__: map,
          seats_cancelled: integer
        }

  @doc """
  Remove users from the Copilot subscription for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Sets seats for all users specified to "pending cancellation".
  This will cause the specified users to lose access to GitHub Copilot at the end of the current billing cycle unless they retain access through team membership.
  For more information about disabling access to Copilot, see "[Revoking access to Copilot for members of your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-access-to-github-copilot-in-your-organization/revoking-access-to-copilot-for-members-of-your-organization)."

  Only organization owners can cancel Copilot seats for their organization members.

  The response contains the total number of seats set to "pending cancellation".

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `admin:org` scopes to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-user-management#remove-users-from-the-copilot-subscription-for-an-organization)

  """
  @spec cancel_copilot_seat_assignment_for_users(String.t(), map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def cancel_copilot_seat_assignment_for_users(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Copilot, :cancel_copilot_seat_assignment_for_users},
      url: "/orgs/#{org}/copilot/billing/selected_users",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.Copilot, :cancel_copilot_seat_assignment_for_users_200_json_resp}},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, :null},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Copilot metrics for an organization

  Use this endpoint to see a breakdown of aggregated metrics for various GitHub Copilot features. See the response schema tab for detailed metrics definitions.

  > [!NOTE]
  > This endpoint will only return results for a given day if the organization contained **five or more members with active Copilot licenses** on that day, as evaluated at the end of that day.

  The response contains metrics for up to 28 days prior. Metrics are processed once per day for the previous day,
  and the response will only include data up until yesterday. In order for an end user to be counted towards these metrics,
  they must have telemetry enabled in their IDE.

  To access this endpoint, the Copilot Metrics API access policy must be enabled for the organization.
  Only organization owners and owners and billing managers of the parent enterprise can view Copilot metrics.

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot`, `read:org`, or `read:enterprise` scopes to use this endpoint.

  ## Options

    * `since`: Show usage metrics since this date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:MM:SSZ`). Maximum value is 28 days ago.
    * `until`: Show usage metrics until this date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:MM:SSZ`) and should not preceed the `since` date if it is passed.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of days of metrics to display per page (max 28). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-metrics#get-copilot-metrics-for-an-organization)

  """
  @spec copilot_metrics_for_organization(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.CopilotUsageMetricsDay.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def copilot_metrics_for_organization(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :since, :until])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Copilot, :copilot_metrics_for_organization},
      url: "/orgs/#{org}/copilot/metrics",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.CopilotUsageMetricsDay, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.BasicError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Copilot metrics for a team

  Use this endpoint to see a breakdown of aggregated metrics for various GitHub Copilot features. See the response schema tab for detailed metrics definitions.

  > [!NOTE]
  > This endpoint will only return results for a given day if the team had **five or more members with active Copilot licenses** on that day, as evaluated at the end of that day.

  The response contains metrics for up to 28 days prior. Metrics are processed once per day for the previous day,
  and the response will only include data up until yesterday. In order for an end user to be counted towards these metrics,
  they must have telemetry enabled in their IDE.

  To access this endpoint, the Copilot Metrics API access policy must be enabled for the organization containing the team within GitHub settings.
  Only organization owners for the organization that contains this team and owners and billing managers of the parent enterprise can view Copilot metrics for a team.

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot`, `read:org`, or `read:enterprise` scopes to use this endpoint.

  ## Options

    * `since`: Show usage metrics since this date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:MM:SSZ`). Maximum value is 28 days ago.
    * `until`: Show usage metrics until this date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:MM:SSZ`) and should not preceed the `since` date if it is passed.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of days of metrics to display per page (max 28). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-metrics#get-copilot-metrics-for-a-team)

  """
  @spec copilot_metrics_for_team(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.CopilotUsageMetricsDay.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def copilot_metrics_for_team(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :since, :until])

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHubOpenAPI.Copilot, :copilot_metrics_for_team},
      url: "/orgs/#{org}/team/#{team_slug}/copilot/metrics",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.CopilotUsageMetricsDay, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.BasicError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Copilot seat information and settings for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Gets information about an organization's Copilot subscription, including seat breakdown
  and feature policies. To configure these settings, go to your organization's settings on GitHub.com.
  For more information, see "[Managing policies for Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-policies-for-copilot-business-in-your-organization)."

  Only organization owners can view details about the organization's Copilot Business or Copilot Enterprise subscription.

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `read:org` scopes to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-user-management#get-copilot-seat-information-and-settings-for-an-organization)

  """
  @spec get_copilot_organization_details(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.CopilotOrganizationDetails.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_copilot_organization_details(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Copilot, :get_copilot_organization_details},
      url: "/orgs/#{org}/copilot/billing",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.CopilotOrganizationDetails, :t}},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, :null},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Copilot seat assignment details for a user

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Gets the GitHub Copilot seat details for a member of an organization who currently has access to GitHub Copilot.

  The seat object contains information about the user's most recent Copilot activity. Users must have telemetry enabled in their IDE for Copilot in the IDE activity to be reflected in `last_activity_at`.
  For more information about activity data, see "[Reviewing user activity data for Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/reviewing-activity-related-to-github-copilot-in-your-organization/reviewing-user-activity-data-for-copilot-in-your-organization)."

  Only organization owners can view Copilot seat assignment details for members of their organization.

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `read:org` scopes to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-user-management#get-copilot-seat-assignment-details-for-a-user)

  """
  @spec get_copilot_seat_details_for_user(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.CopilotSeatDetails.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_copilot_seat_details_for_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Copilot, :get_copilot_seat_details_for_user},
      url: "/orgs/#{org}/members/#{username}/copilot",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.CopilotSeatDetails, :t}},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, :null},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type list_copilot_seats_200_json_resp :: %{
          __info__: map,
          seats: [GitHubOpenAPI.CopilotSeatDetails.t()] | nil,
          total_seats: integer | nil
        }

  @doc """
  List all Copilot seat assignments for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Lists all Copilot seats for which an organization with a Copilot Business or Copilot Enterprise subscription is currently being billed.
  Only organization owners can view assigned seats.

  Each seat object contains information about the assigned user's most recent Copilot activity. Users must have telemetry enabled in their IDE for Copilot in the IDE activity to be reflected in `last_activity_at`.
  For more information about activity data, see "[Reviewing user activity data for Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/reviewing-activity-related-to-github-copilot-in-your-organization/reviewing-user-activity-data-for-copilot-in-your-organization)."

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `read:org` scopes to use this endpoint.

  ## Options

    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-user-management#list-all-copilot-seat-assignments-for-an-organization)

  """
  @spec list_copilot_seats(String.t(), keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_copilot_seats(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Copilot, :list_copilot_seats},
      url: "/orgs/#{org}/copilot/billing/seats",
      method: :get,
      query: query,
      response: [
        {200, {GitHubOpenAPI.Copilot, :list_copilot_seats_200_json_resp}},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a summary of Copilot usage for organization members

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  You can use this endpoint to see a daily breakdown of aggregated usage metrics for Copilot completions and Copilot Chat in the IDE
  across an organization, with a further breakdown of suggestions, acceptances, and number of active users by editor and language for each day.
  See the response schema tab for detailed metrics definitions.

  The response contains metrics for up to 28 days prior. Usage metrics are processed once per day for the previous day,
  and the response will only include data up until yesterday. In order for an end user to be counted towards these metrics,
  they must have telemetry enabled in their IDE.

  Organization owners, and owners and billing managers of the parent enterprise, can view Copilot usage metrics.

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot`, `read:org`, or `read:enterprise` scopes to use this endpoint.

  ## Options

    * `since`: Show usage metrics since this date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:MM:SSZ`). Maximum value is 28 days ago.
    * `until`: Show usage metrics until this date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:MM:SSZ`) and should not preceed the `since` date if it is passed.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of days of metrics to display per page (max 28). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-usage#get-a-summary-of-copilot-usage-for-organization-members)

  """
  @spec usage_metrics_for_org(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.CopilotUsageMetrics.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def usage_metrics_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :since, :until])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Copilot, :usage_metrics_for_org},
      url: "/orgs/#{org}/copilot/usage",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.CopilotUsageMetrics, :t}]},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a summary of Copilot usage for a team

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  You can use this endpoint to see a daily breakdown of aggregated usage metrics for Copilot completions and Copilot Chat in the IDE
  for users within a team, with a further breakdown of suggestions, acceptances, and number of active users by editor and language for each day.
  See the response schema tab for detailed metrics definitions.

  The response contains metrics for up to 28 days prior. Usage metrics are processed once per day for the previous day,
  and the response will only include data up until yesterday. In order for an end user to be counted towards these metrics,
  they must have telemetry enabled in their IDE.

  > [!NOTE]
  > This endpoint will only return results for a given day if the team had five or more members with active Copilot licenses, as evaluated at the end of that day.

  Organization owners for the organization that contains this team, and owners and billing managers of the parent enterprise can view Copilot usage metrics for a team.

  OAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot`, `read:org`, or `read:enterprise` scopes to use this endpoint.

  ## Options

    * `since`: Show usage metrics since this date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:MM:SSZ`). Maximum value is 28 days ago.
    * `until`: Show usage metrics until this date. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDTHH:MM:SSZ`) and should not preceed the `since` date if it is passed.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of days of metrics to display per page (max 28). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/copilot/copilot-usage#get-a-summary-of-copilot-usage-for-a-team)

  """
  @spec usage_metrics_for_team(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.CopilotUsageMetrics.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def usage_metrics_for_team(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :since, :until])

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHubOpenAPI.Copilot, :usage_metrics_for_team},
      url: "/orgs/#{org}/team/#{team_slug}/copilot/usage",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.CopilotUsageMetrics, :t}]},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_copilot_seats_for_teams_201_json_resp) do
    [seats_created: :integer]
  end

  def __fields__(:add_copilot_seats_for_users_201_json_resp) do
    [seats_created: :integer]
  end

  def __fields__(:cancel_copilot_seat_assignment_for_teams_200_json_resp) do
    [seats_cancelled: :integer]
  end

  def __fields__(:cancel_copilot_seat_assignment_for_users_200_json_resp) do
    [seats_cancelled: :integer]
  end

  def __fields__(:list_copilot_seats_200_json_resp) do
    [seats: [{GitHubOpenAPI.CopilotSeatDetails, :t}], total_seats: :integer]
  end
end
