defmodule GitHubOpenAPI.ApiInsights do
  @moduledoc """
  Provides API endpoints related to api insights
  """

  @default_client GitHubOpenAPI.Client

  @doc """
  Get route stats by actor

  Get API request count statistics for an actor broken down by route within a specified time frame.

  ## Options

    * `min_timestamp`: The minimum timestamp to query for stats. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `max_timestamp`: The maximum timestamp to query for stats. Defaults to the time 30 days ago. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `direction`: The direction to sort the results by.
    * `sort`: The property to sort the results by.
    * `api_route_substring`: Providing a substring will filter results where the API route contains the substring. This is a case-insensitive search.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/api-insights#get-route-stats-by-actor)

  """
  @spec get_route_stats_by_actor(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.ApiInsightsRouteStats.t()]} | :error
  def get_route_stats_by_actor(org, actor_type, actor_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :api_route_substring,
        :direction,
        :max_timestamp,
        :min_timestamp,
        :page,
        :per_page,
        :sort
      ])

    client.request(%{
      args: [org: org, actor_type: actor_type, actor_id: actor_id],
      call: {GitHubOpenAPI.ApiInsights, :get_route_stats_by_actor},
      url: "/orgs/#{org}/insights/api/route-stats/#{actor_type}/#{actor_id}",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.ApiInsightsRouteStats, :t}]}],
      opts: opts
    })
  end

  @doc """
  Get subject stats

  Get API request statistics for all subjects within an organization within a specified time frame. Subjects can be users or GitHub Apps.

  ## Options

    * `min_timestamp`: The minimum timestamp to query for stats. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `max_timestamp`: The maximum timestamp to query for stats. Defaults to the time 30 days ago. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `direction`: The direction to sort the results by.
    * `sort`: The property to sort the results by.
    * `subject_name_substring`: Providing a substring will filter results where the subject name contains the substring. This is a case-insensitive search.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/api-insights#get-subject-stats)

  """
  @spec get_subject_stats(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.ApiInsightsSubjectStats.t()]} | :error
  def get_subject_stats(org, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :direction,
        :max_timestamp,
        :min_timestamp,
        :page,
        :per_page,
        :sort,
        :subject_name_substring
      ])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.ApiInsights, :get_subject_stats},
      url: "/orgs/#{org}/insights/api/subject-stats",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.ApiInsightsSubjectStats, :t}]}],
      opts: opts
    })
  end

  @doc """
  Get summary stats

  Get overall statistics of API requests made within an organization by all users and apps within a specified time frame.

  ## Options

    * `min_timestamp`: The minimum timestamp to query for stats. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `max_timestamp`: The maximum timestamp to query for stats. Defaults to the time 30 days ago. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/api-insights#get-summary-stats)

  """
  @spec get_summary_stats(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.ApiInsightsSummaryStats.t()} | :error
  def get_summary_stats(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:max_timestamp, :min_timestamp])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.ApiInsights, :get_summary_stats},
      url: "/orgs/#{org}/insights/api/summary-stats",
      method: :get,
      query: query,
      response: [{200, {GitHubOpenAPI.ApiInsightsSummaryStats, :t}}],
      opts: opts
    })
  end

  @doc """
  Get summary stats by actor

  Get overall statistics of API requests within the organization made by a specific actor. Actors can be GitHub App installations, OAuth apps or other tokens on behalf of a user.

  ## Options

    * `min_timestamp`: The minimum timestamp to query for stats. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `max_timestamp`: The maximum timestamp to query for stats. Defaults to the time 30 days ago. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/api-insights#get-summary-stats-by-actor)

  """
  @spec get_summary_stats_by_actor(String.t(), String.t(), integer, keyword) ::
          {:ok, GitHubOpenAPI.ApiInsightsSummaryStats.t()} | :error
  def get_summary_stats_by_actor(org, actor_type, actor_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:max_timestamp, :min_timestamp])

    client.request(%{
      args: [org: org, actor_type: actor_type, actor_id: actor_id],
      call: {GitHubOpenAPI.ApiInsights, :get_summary_stats_by_actor},
      url: "/orgs/#{org}/insights/api/summary-stats/#{actor_type}/#{actor_id}",
      method: :get,
      query: query,
      response: [{200, {GitHubOpenAPI.ApiInsightsSummaryStats, :t}}],
      opts: opts
    })
  end

  @doc """
  Get summary stats by user

  Get overall statistics of API requests within the organization for a user.

  ## Options

    * `min_timestamp`: The minimum timestamp to query for stats. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `max_timestamp`: The maximum timestamp to query for stats. Defaults to the time 30 days ago. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/api-insights#get-summary-stats-by-user)

  """
  @spec get_summary_stats_by_user(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.ApiInsightsSummaryStats.t()} | :error
  def get_summary_stats_by_user(org, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:max_timestamp, :min_timestamp])

    client.request(%{
      args: [org: org, user_id: user_id],
      call: {GitHubOpenAPI.ApiInsights, :get_summary_stats_by_user},
      url: "/orgs/#{org}/insights/api/summary-stats/users/#{user_id}",
      method: :get,
      query: query,
      response: [{200, {GitHubOpenAPI.ApiInsightsSummaryStats, :t}}],
      opts: opts
    })
  end

  @doc """
  Get time stats

  Get the number of API requests and rate-limited requests made within an organization over a specified time period.

  ## Options

    * `min_timestamp`: The minimum timestamp to query for stats. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `max_timestamp`: The maximum timestamp to query for stats. Defaults to the time 30 days ago. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `timestamp_increment`: The increment of time used to breakdown the query results (5m, 10m, 1h, etc.)

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/api-insights#get-time-stats)

  """
  @spec get_time_stats(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.ApiInsightsTimeStats.t()]} | :error
  def get_time_stats(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:max_timestamp, :min_timestamp, :timestamp_increment])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.ApiInsights, :get_time_stats},
      url: "/orgs/#{org}/insights/api/time-stats",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.ApiInsightsTimeStats, :t}]}],
      opts: opts
    })
  end

  @doc """
  Get time stats by actor

  Get the number of API requests and rate-limited requests made within an organization by a specific actor within a specified time period.

  ## Options

    * `min_timestamp`: The minimum timestamp to query for stats. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `max_timestamp`: The maximum timestamp to query for stats. Defaults to the time 30 days ago. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `timestamp_increment`: The increment of time used to breakdown the query results (5m, 10m, 1h, etc.)

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/api-insights#get-time-stats-by-actor)

  """
  @spec get_time_stats_by_actor(String.t(), String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.ApiInsightsTimeStats.t()]} | :error
  def get_time_stats_by_actor(org, actor_type, actor_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:max_timestamp, :min_timestamp, :timestamp_increment])

    client.request(%{
      args: [org: org, actor_type: actor_type, actor_id: actor_id],
      call: {GitHubOpenAPI.ApiInsights, :get_time_stats_by_actor},
      url: "/orgs/#{org}/insights/api/time-stats/#{actor_type}/#{actor_id}",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.ApiInsightsTimeStats, :t}]}],
      opts: opts
    })
  end

  @doc """
  Get time stats by user

  Get the number of API requests and rate-limited requests made within an organization by a specific user over a specified time period.

  ## Options

    * `min_timestamp`: The minimum timestamp to query for stats. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `max_timestamp`: The maximum timestamp to query for stats. Defaults to the time 30 days ago. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `timestamp_increment`: The increment of time used to breakdown the query results (5m, 10m, 1h, etc.)

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/api-insights#get-time-stats-by-user)

  """
  @spec get_time_stats_by_user(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.ApiInsightsTimeStats.t()]} | :error
  def get_time_stats_by_user(org, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:max_timestamp, :min_timestamp, :timestamp_increment])

    client.request(%{
      args: [org: org, user_id: user_id],
      call: {GitHubOpenAPI.ApiInsights, :get_time_stats_by_user},
      url: "/orgs/#{org}/insights/api/time-stats/users/#{user_id}",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.ApiInsightsTimeStats, :t}]}],
      opts: opts
    })
  end

  @doc """
  Get user stats

  Get API usage statistics within an organization for a user broken down by the type of access.

  ## Options

    * `min_timestamp`: The minimum timestamp to query for stats. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `max_timestamp`: The maximum timestamp to query for stats. Defaults to the time 30 days ago. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `direction`: The direction to sort the results by.
    * `sort`: The property to sort the results by.
    * `actor_name_substring`: Providing a substring will filter results where the actor name contains the substring. This is a case-insensitive search.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/api-insights#get-user-stats)

  """
  @spec get_user_stats(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.ApiInsightsUserStats.t()]} | :error
  def get_user_stats(org, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :actor_name_substring,
        :direction,
        :max_timestamp,
        :min_timestamp,
        :page,
        :per_page,
        :sort
      ])

    client.request(%{
      args: [org: org, user_id: user_id],
      call: {GitHubOpenAPI.ApiInsights, :get_user_stats},
      url: "/orgs/#{org}/insights/api/user-stats/#{user_id}",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.ApiInsightsUserStats, :t}]}],
      opts: opts
    })
  end
end
