defmodule GitHubOpenAPI.Activity do
  @moduledoc """
  Provides API endpoints related to activity
  """
  use Apipe.Providers.OpenAPI.Encoder

  @default_client GitHubOpenAPI.Client

  @doc """
  Check if a repository is starred by the authenticated user

  Whether the authenticated user has starred the repository.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/starring#check-if-a-repository-is-starred-by-the-authenticated-user)

  """
  @spec check_repo_is_starred_by_authenticated_user(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def check_repo_is_starred_by_authenticated_user(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :check_repo_is_starred_by_authenticated_user},
      url: "/user/starred/#{owner}/#{repo}",
      method: :get,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a repository subscription

  This endpoint should only be used to stop watching a repository. To control whether or not you wish to receive notifications from a repository, [set the repository's subscription manually](https://docs.github.com/rest/activity/watching#set-a-repository-subscription).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/watching#delete-a-repository-subscription)

  """
  @spec delete_repo_subscription(String.t(), String.t(), keyword) :: :ok | :error
  def delete_repo_subscription(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :delete_repo_subscription},
      url: "/repos/#{owner}/#{repo}/subscription",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Delete a thread subscription

  Mutes all future notifications for a conversation until you comment on the thread or get an **@mention**. If you are watching the repository of the thread, you will still receive notifications. To ignore future notifications for a repository you are watching, use the [Set a thread subscription](https://docs.github.com/rest/activity/notifications#set-a-thread-subscription) endpoint and set `ignore` to `true`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#delete-a-thread-subscription)

  """
  @spec delete_thread_subscription(integer, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def delete_thread_subscription(thread_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id],
      call: {GitHubOpenAPI.Activity, :delete_thread_subscription},
      url: "/notifications/threads/#{thread_id}/subscription",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get feeds

  Lists the feeds available to the authenticated user. The response provides a URL for each feed. You can then get a specific feed by sending a request to one of the feed URLs.

  *   **Timeline**: The GitHub global public timeline
  *   **User**: The public timeline for any user, using `uri_template`. For more information, see "[Hypermedia](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#hypermedia)."
  *   **Current user public**: The public timeline for the authenticated user
  *   **Current user**: The private timeline for the authenticated user
  *   **Current user actor**: The private timeline for activity created by the authenticated user
  *   **Current user organizations**: The private timeline for the organizations the authenticated user is a member of.
  *   **Security advisories**: A collection of public announcements that provide information about security-related vulnerabilities in software on GitHub.

  By default, timeline resources are returned in JSON. You can specify the `application/atom+xml` type in the `Accept` header to return timeline resources in Atom format. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  > [!NOTE]
  > Private feeds are only returned when [authenticating via Basic Auth](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication) since current feed URIs use the older, non revocable auth tokens.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/feeds#get-feeds)

  """
  @spec get_feeds(keyword) :: {:ok, GitHubOpenAPI.Feed.t()} | :error
  def get_feeds(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Activity, :get_feeds},
      url: "/feeds",
      method: :get,
      response: [{200, {GitHubOpenAPI.Feed, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a repository subscription

  Gets information about whether the authenticated user is subscribed to the repository.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/watching#get-a-repository-subscription)

  """
  @spec get_repo_subscription(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.RepositorySubscription.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_repo_subscription(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :get_repo_subscription},
      url: "/repos/#{owner}/#{repo}/subscription",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.RepositorySubscription, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Get a thread

  Gets information about a notification thread.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#get-a-thread)

  """
  @spec get_thread(integer, keyword) ::
          {:ok, GitHubOpenAPI.Thread.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_thread(thread_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id],
      call: {GitHubOpenAPI.Activity, :get_thread},
      url: "/notifications/threads/#{thread_id}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.Thread, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a thread subscription for the authenticated user

  This checks to see if the current user is subscribed to a thread. You can also [get a repository subscription](https://docs.github.com/rest/activity/watching#get-a-repository-subscription).

  Note that subscriptions are only generated if a user is participating in a conversation--for example, they've replied to the thread, were **@mentioned**, or manually subscribe to a thread.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#get-a-thread-subscription-for-the-authenticated-user)

  """
  @spec get_thread_subscription_for_authenticated_user(integer, keyword) ::
          {:ok, GitHubOpenAPI.ThreadSubscription.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_thread_subscription_for_authenticated_user(thread_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id],
      call: {GitHubOpenAPI.Activity, :get_thread_subscription_for_authenticated_user},
      url: "/notifications/threads/#{thread_id}/subscription",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.ThreadSubscription, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List events for the authenticated user

  If you are authenticated as the given user, you will see your private events. Otherwise, you'll only see public events. _Optional_: use the fine-grained token with following permission set to view private events: "Events" user permissions (read).

  > [!NOTE]
  > This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/events#list-events-for-the-authenticated-user)

  """
  @spec list_events_for_authenticated_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.Event.t()]} | :error
  def list_events_for_authenticated_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Activity, :list_events_for_authenticated_user},
      url: "/users/#{username}/events",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.Event, :t}]}],
      opts: opts
    })
  end

  @doc """
  List notifications for the authenticated user

  List all notifications for the current user, sorted by most recently updated.

  ## Options

    * `all`: If `true`, show notifications marked as read.
    * `participating`: If `true`, only shows notifications in which the user is directly participating or mentioned.
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `before`: Only show notifications updated before the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 50). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#list-notifications-for-the-authenticated-user)

  """
  @spec list_notifications_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.Thread.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def list_notifications_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:all, :before, :page, :participating, :per_page, :since])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Activity, :list_notifications_for_authenticated_user},
      url: "/notifications",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.Thread, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List organization events for the authenticated user

  This is the user's organization dashboard. You must be authenticated as the user to view this.

  > [!NOTE]
  > This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/events#list-organization-events-for-the-authenticated-user)

  """
  @spec list_org_events_for_authenticated_user(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.Event.t()]} | :error
  def list_org_events_for_authenticated_user(username, org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username, org: org],
      call: {GitHubOpenAPI.Activity, :list_org_events_for_authenticated_user},
      url: "/users/#{username}/events/orgs/#{org}",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.Event, :t}]}],
      opts: opts
    })
  end

  @doc """
  List public events

  > [!NOTE]
  > This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/events#list-public-events)

  """
  @spec list_public_events(keyword) ::
          {:ok, [GitHubOpenAPI.Event.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ServiceUnavailable.json_resp()}
  def list_public_events(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Activity, :list_public_events},
      url: "/events",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.Event, :t}]},
        {304, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {503, {GitHubOpenAPI.ServiceUnavailable, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  List public events for a network of repositories

  > [!NOTE]
  > This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/events#list-public-events-for-a-network-of-repositories)

  """
  @spec list_public_events_for_repo_network(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.Event.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_public_events_for_repo_network(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :list_public_events_for_repo_network},
      url: "/networks/#{owner}/#{repo}/events",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.Event, :t}]},
        {301, {GitHubOpenAPI.BasicError, :t}},
        {304, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List public events for a user

  > [!NOTE]
  > This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/events#list-public-events-for-a-user)

  """
  @spec list_public_events_for_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.Event.t()]} | :error
  def list_public_events_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Activity, :list_public_events_for_user},
      url: "/users/#{username}/events/public",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.Event, :t}]}],
      opts: opts
    })
  end

  @doc """
  List public organization events

  > [!NOTE]
  > This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/events#list-public-organization-events)

  """
  @spec list_public_org_events(String.t(), keyword) :: {:ok, [GitHubOpenAPI.Event.t()]} | :error
  def list_public_org_events(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Activity, :list_public_org_events},
      url: "/orgs/#{org}/events",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.Event, :t}]}],
      opts: opts
    })
  end

  @doc """
  List events received by the authenticated user

  These are events that you've received by watching repositories and following users. If you are authenticated as the
  given user, you will see private events. Otherwise, you'll only see public events.

  > [!NOTE]
  > This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/events#list-events-received-by-the-authenticated-user)

  """
  @spec list_received_events_for_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.Event.t()]} | :error
  def list_received_events_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Activity, :list_received_events_for_user},
      url: "/users/#{username}/received_events",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.Event, :t}]}],
      opts: opts
    })
  end

  @doc """
  List public events received by a user

  > [!NOTE]
  > This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/events#list-public-events-received-by-a-user)

  """
  @spec list_received_public_events_for_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.Event.t()]} | :error
  def list_received_public_events_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Activity, :list_received_public_events_for_user},
      url: "/users/#{username}/received_events/public",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.Event, :t}]}],
      opts: opts
    })
  end

  @doc """
  List repository events

  > [!NOTE]
  > This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/events#list-repository-events)

  """
  @spec list_repo_events(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.Event.t()]} | :error
  def list_repo_events(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :list_repo_events},
      url: "/repos/#{owner}/#{repo}/events",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.Event, :t}]}],
      opts: opts
    })
  end

  @doc """
  List repository notifications for the authenticated user

  Lists all notifications for the current user in the specified repository.

  ## Options

    * `all`: If `true`, show notifications marked as read.
    * `participating`: If `true`, only shows notifications in which the user is directly participating or mentioned.
    * `since`: Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `before`: Only show notifications updated before the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#list-repository-notifications-for-the-authenticated-user)

  """
  @spec list_repo_notifications_for_authenticated_user(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.Thread.t()]} | :error
  def list_repo_notifications_for_authenticated_user(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:all, :before, :page, :participating, :per_page, :since])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :list_repo_notifications_for_authenticated_user},
      url: "/repos/#{owner}/#{repo}/notifications",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.Thread, :t}]}],
      opts: opts
    })
  end

  @doc """
  List repositories starred by the authenticated user

  Lists repositories the authenticated user has starred.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.star+json`**: Includes a timestamp of when the star was created.

  ## Options

    * `sort`: The property to sort the results by. `created` means when the repository was starred. `updated` means when the repository was last pushed to.
    * `direction`: The direction to sort the results by.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/starring#list-repositories-starred-by-the-authenticated-user)

  """
  @spec list_repos_starred_by_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.Repository.t()] | [GitHubOpenAPI.StarredRepository.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def list_repos_starred_by_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page, :sort])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Activity, :list_repos_starred_by_authenticated_user},
      url: "/user/starred",
      method: :get,
      query: query,
      response: [
        {200,
         {:union, [[{GitHubOpenAPI.Repository, :t}], [{GitHubOpenAPI.StarredRepository, :t}]]}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List repositories starred by a user

  Lists repositories a user has starred.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.star+json`**: Includes a timestamp of when the star was created.

  ## Options

    * `sort`: The property to sort the results by. `created` means when the repository was starred. `updated` means when the repository was last pushed to.
    * `direction`: The direction to sort the results by.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/starring#list-repositories-starred-by-a-user)

  """
  @spec list_repos_starred_by_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.Repository.t()] | [GitHubOpenAPI.StarredRepository.t()]} | :error
  def list_repos_starred_by_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:direction, :page, :per_page, :sort])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Activity, :list_repos_starred_by_user},
      url: "/users/#{username}/starred",
      method: :get,
      query: query,
      response: [
        {200,
         {:union, [[{GitHubOpenAPI.Repository, :t}], [{GitHubOpenAPI.StarredRepository, :t}]]}}
      ],
      opts: opts
    })
  end

  @doc """
  List repositories watched by a user

  Lists repositories a user is watching.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/watching#list-repositories-watched-by-a-user)

  """
  @spec list_repos_watched_by_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.MinimalRepository.t()]} | :error
  def list_repos_watched_by_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Activity, :list_repos_watched_by_user},
      url: "/users/#{username}/subscriptions",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.MinimalRepository, :t}]}],
      opts: opts
    })
  end

  @doc """
  List stargazers

  Lists the people that have starred the repository.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.star+json`**: Includes a timestamp of when the star was created.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/starring#list-stargazers)

  """
  @spec list_stargazers_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [map] | [GitHubOpenAPI.SimpleUser.t()]}
          | {:error, GitHubOpenAPI.ValidationError.t()}
  def list_stargazers_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :list_stargazers_for_repo},
      url: "/repos/#{owner}/#{repo}/stargazers",
      method: :get,
      query: query,
      response: [
        {200, {:union, [[:map], [{GitHubOpenAPI.SimpleUser, :t}]]}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List repositories watched by the authenticated user

  Lists repositories the authenticated user is watching.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/watching#list-repositories-watched-by-the-authenticated-user)

  """
  @spec list_watched_repos_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.MinimalRepository.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_watched_repos_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Activity, :list_watched_repos_for_authenticated_user},
      url: "/user/subscriptions",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.MinimalRepository, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List watchers

  Lists the people watching the specified repository.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/watching#list-watchers)

  """
  @spec list_watchers_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.SimpleUser.t()]} | :error
  def list_watchers_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :list_watchers_for_repo},
      url: "/repos/#{owner}/#{repo}/subscribers",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.SimpleUser, :t}]}],
      opts: opts
    })
  end

  @type mark_notifications_as_read_202_json_resp :: %{
          __info__: map,
          __joins__: map,
          message: String.t() | nil
        }

  @doc """
  Mark notifications as read

  Marks all notifications as "read" for the current user. If the number of notifications is too large to complete in one request, you will receive a `202 Accepted` status and GitHub will run an asynchronous process to mark notifications as "read." To check whether any "unread" notifications remain, you can use the [List notifications for the authenticated user](https://docs.github.com/rest/activity/notifications#list-notifications-for-the-authenticated-user) endpoint and pass the query parameter `all=false`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#mark-notifications-as-read)

  """
  @spec mark_notifications_as_read(map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def mark_notifications_as_read(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Activity, :mark_notifications_as_read},
      url: "/notifications",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {202, {GitHubOpenAPI.Activity, :mark_notifications_as_read_202_json_resp}},
        {205, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type mark_repo_notifications_as_read_202_json_resp :: %{
          __info__: map,
          __joins__: map,
          message: String.t() | nil,
          url: String.t() | nil
        }

  @doc """
  Mark repository notifications as read

  Marks all notifications in a repository as "read" for the current user. If the number of notifications is too large to complete in one request, you will receive a `202 Accepted` status and GitHub will run an asynchronous process to mark notifications as "read." To check whether any "unread" notifications remain, you can use the [List repository notifications for the authenticated user](https://docs.github.com/rest/activity/notifications#list-repository-notifications-for-the-authenticated-user) endpoint and pass the query parameter `all=false`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#mark-repository-notifications-as-read)

  """
  @spec mark_repo_notifications_as_read(String.t(), String.t(), map, keyword) ::
          {:ok, map} | :error
  def mark_repo_notifications_as_read(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHubOpenAPI.Activity, :mark_repo_notifications_as_read},
      url: "/repos/#{owner}/#{repo}/notifications",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {202, {GitHubOpenAPI.Activity, :mark_repo_notifications_as_read_202_json_resp}},
        {205, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Mark a thread as done

  Marks a thread as "done." Marking a thread as "done" is equivalent to marking a notification in your notification inbox on GitHub as done: https://github.com/notifications.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#mark-a-thread-as-done)

  """
  @spec mark_thread_as_done(integer, keyword) :: :ok | :error
  def mark_thread_as_done(thread_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id],
      call: {GitHubOpenAPI.Activity, :mark_thread_as_done},
      url: "/notifications/threads/#{thread_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Mark a thread as read

  Marks a thread as "read." Marking a thread as "read" is equivalent to clicking a notification in your notification inbox on GitHub: https://github.com/notifications.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#mark-a-thread-as-read)

  """
  @spec mark_thread_as_read(integer, keyword) :: :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def mark_thread_as_read(thread_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id],
      call: {GitHubOpenAPI.Activity, :mark_thread_as_read},
      url: "/notifications/threads/#{thread_id}",
      method: :patch,
      response: [{205, :null}, {304, :null}, {403, {GitHubOpenAPI.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Set a repository subscription

  If you would like to watch a repository, set `subscribed` to `true`. If you would like to ignore notifications made within a repository, set `ignored` to `true`. If you would like to stop watching a repository, [delete the repository's subscription](https://docs.github.com/rest/activity/watching#delete-a-repository-subscription) completely.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/watching#set-a-repository-subscription)

  """
  @spec set_repo_subscription(String.t(), String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.RepositorySubscription.t()} | :error
  def set_repo_subscription(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHubOpenAPI.Activity, :set_repo_subscription},
      url: "/repos/#{owner}/#{repo}/subscription",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {GitHubOpenAPI.RepositorySubscription, :t}}],
      opts: opts
    })
  end

  @doc """
  Set a thread subscription

  If you are watching a repository, you receive notifications for all threads by default. Use this endpoint to ignore future notifications for threads until you comment on the thread or get an **@mention**.

  You can also use this endpoint to subscribe to threads that you are currently not receiving notifications for or to subscribed to threads that you have previously ignored.

  Unsubscribing from a conversation in a repository that you are not watching is functionally equivalent to the [Delete a thread subscription](https://docs.github.com/rest/activity/notifications#delete-a-thread-subscription) endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/notifications#set-a-thread-subscription)

  """
  @spec set_thread_subscription(integer, map, keyword) ::
          {:ok, GitHubOpenAPI.ThreadSubscription.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def set_thread_subscription(thread_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, body: body],
      call: {GitHubOpenAPI.Activity, :set_thread_subscription},
      url: "/notifications/threads/#{thread_id}/subscription",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.ThreadSubscription, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Star a repository for the authenticated user

  Note that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/starring#star-a-repository-for-the-authenticated-user)

  """
  @spec star_repo_for_authenticated_user(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def star_repo_for_authenticated_user(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :star_repo_for_authenticated_user},
      url: "/user/starred/#{owner}/#{repo}",
      method: :put,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Unstar a repository for the authenticated user

  Unstar a repository that the authenticated user has previously starred.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/activity/starring#unstar-a-repository-for-the-authenticated-user)

  """
  @spec unstar_repo_for_authenticated_user(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def unstar_repo_for_authenticated_user(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.Activity, :unstar_repo_for_authenticated_user},
      url: "/user/starred/#{owner}/#{repo}",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          activity_type: String.t(),
          actor: GitHubOpenAPI.SimpleUser.t() | nil,
          after: String.t(),
          before: String.t(),
          id: integer,
          node_id: String.t(),
          ref: String.t(),
          timestamp: DateTime.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :activity_type,
    :actor,
    :after,
    :before,
    :id,
    :node_id,
    :ref,
    :timestamp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:mark_notifications_as_read_202_json_resp) do
    [message: {:string, :generic}]
  end

  def __fields__(:mark_repo_notifications_as_read_202_json_resp) do
    [message: {:string, :generic}, url: {:string, :generic}]
  end

  def __fields__(:t) do
    [
      activity_type:
        {:enum,
         [
           "push",
           "force_push",
           "branch_deletion",
           "branch_creation",
           "pr_merge",
           "merge_queue_merge"
         ]},
      actor: {:union, [{GitHubOpenAPI.SimpleUser, :t}, :null]},
      after: {:string, :generic},
      before: {:string, :generic},
      id: :integer,
      node_id: {:string, :generic},
      ref: {:string, :generic},
      timestamp: {:string, :date_time}
    ]
  end
end
