defmodule GitHubOpenAPI.CodeSecurity do
  @moduledoc """
  Provides API endpoints related to code security
  """

  @default_client GitHubOpenAPI.Client

  @doc """
  Attach a configuration to repositories

  Attach a code security configuration to a set of repositories. If the repositories specified are already attached to a configuration, they will be re-attached to the provided configuration.

  If insufficient GHAS licenses are available to attach the configuration to a repository, only free features will be enabled.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#attach-a-configuration-to-repositories)

  """
  @spec attach_configuration(String.t(), integer, map, keyword) :: {:ok, map} | :error
  def attach_configuration(org, configuration_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, configuration_id: configuration_id, body: body],
      call: {GitHubOpenAPI.CodeSecurity, :attach_configuration},
      url: "/orgs/#{org}/code-security/configurations/#{configuration_id}/attach",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{202, :map}],
      opts: opts
    })
  end

  @doc """
  Attach an enterprise configuration to repositories

  Attaches an enterprise code security configuration to repositories. If the repositories specified are already attached to a configuration, they will be re-attached to the provided configuration.

  If insufficient GHAS licenses are available to attach the configuration to a repository, only free features will be enabled.

  The authenticated user must be an administrator for the enterprise to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#attach-an-enterprise-configuration-to-repositories)

  """
  @spec attach_enterprise_configuration(String.t(), integer, map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def attach_enterprise_configuration(enterprise, configuration_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [enterprise: enterprise, configuration_id: configuration_id, body: body],
      call: {GitHubOpenAPI.CodeSecurity, :attach_enterprise_configuration},
      url: "/enterprises/#{enterprise}/code-security/configurations/#{configuration_id}/attach",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {202, :map},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {409, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a code security configuration

  Creates a code security configuration in an organization.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#create-a-code-security-configuration)

  """
  @spec create_configuration(String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.CodeSecurityConfiguration.t()} | :error
  def create_configuration(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.CodeSecurity, :create_configuration},
      url: "/orgs/#{org}/code-security/configurations",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHubOpenAPI.CodeSecurityConfiguration, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a code security configuration for an enterprise

  Creates a code security configuration in an enterprise.

  The authenticated user must be an administrator of the enterprise in order to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#create-a-code-security-configuration-for-an-enterprise)

  """
  @spec create_configuration_for_enterprise(String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.CodeSecurityConfiguration.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ScimError.t()}
  def create_configuration_for_enterprise(enterprise, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [enterprise: enterprise, body: body],
      call: {GitHubOpenAPI.CodeSecurity, :create_configuration_for_enterprise},
      url: "/enterprises/#{enterprise}/code-security/configurations",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHubOpenAPI.CodeSecurityConfiguration, :t}},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a code security configuration

  Deletes the desired code security configuration from an organization.
  Repositories attached to the configuration will retain their settings but will no longer be associated with
  the configuration.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#delete-a-code-security-configuration)

  """
  @spec delete_configuration(String.t(), integer, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ScimError.t()}
  def delete_configuration(org, configuration_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, configuration_id: configuration_id],
      call: {GitHubOpenAPI.CodeSecurity, :delete_configuration},
      url: "/orgs/#{org}/code-security/configurations/#{configuration_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {409, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a code security configuration for an enterprise

  Deletes a code security configuration from an enterprise.
  Repositories attached to the configuration will retain their settings but will no longer be associated with
  the configuration.

  The authenticated user must be an administrator for the enterprise to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#delete-a-code-security-configuration-for-an-enterprise)

  """
  @spec delete_configuration_for_enterprise(String.t(), integer, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ScimError.t()}
  def delete_configuration_for_enterprise(enterprise, configuration_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [enterprise: enterprise, configuration_id: configuration_id],
      call: {GitHubOpenAPI.CodeSecurity, :delete_configuration_for_enterprise},
      url: "/enterprises/#{enterprise}/code-security/configurations/#{configuration_id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {409, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Detach configurations from repositories

  Detach code security configuration(s) from a set of repositories.
  Repositories will retain their settings but will no longer be associated with the configuration.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#detach-configurations-from-repositories)

  """
  @spec detach_configuration(String.t(), map, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ScimError.t()}
  def detach_configuration(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.CodeSecurity, :detach_configuration},
      url: "/orgs/#{org}/code-security/configurations/detach",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {409, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a code security configuration

  Gets a code security configuration available in an organization.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#get-a-code-security-configuration)

  """
  @spec get_configuration(String.t(), integer, keyword) ::
          {:ok, GitHubOpenAPI.CodeSecurityConfiguration.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_configuration(org, configuration_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, configuration_id: configuration_id],
      call: {GitHubOpenAPI.CodeSecurity, :get_configuration},
      url: "/orgs/#{org}/code-security/configurations/#{configuration_id}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.CodeSecurityConfiguration, :t}},
        {304, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get the code security configuration associated with a repository

  Get the code security configuration that manages a repository's code security settings.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#get-the-code-security-configuration-associated-with-a-repository)

  """
  @spec get_configuration_for_repository(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.CodeSecurityConfigurationForRepository.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_configuration_for_repository(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.CodeSecurity, :get_configuration_for_repository},
      url: "/repos/#{owner}/#{repo}/code-security-configuration",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.CodeSecurityConfigurationForRepository, :t}},
        {204, :null},
        {304, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get code security configurations for an enterprise

  Lists all code security configurations available in an enterprise.

  The authenticated user must be an administrator of the enterprise in order to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `read:enterprise` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#get-code-security-configurations-for-an-enterprise)

  """
  @spec get_configurations_for_enterprise(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.CodeSecurityConfiguration.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_configurations_for_enterprise(enterprise, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :per_page])

    client.request(%{
      args: [enterprise: enterprise],
      call: {GitHubOpenAPI.CodeSecurity, :get_configurations_for_enterprise},
      url: "/enterprises/#{enterprise}/code-security/configurations",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.CodeSecurityConfiguration, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get code security configurations for an organization

  Lists all code security configurations available in an organization.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Options

    * `target_type`: The target type of the code security configuration
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#get-code-security-configurations-for-an-organization)

  """
  @spec get_configurations_for_org(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.CodeSecurityConfiguration.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_configurations_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :per_page, :target_type])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.CodeSecurity, :get_configurations_for_org},
      url: "/orgs/#{org}/code-security/configurations",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.CodeSecurityConfiguration, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get default code security configurations

  Lists the default code security configurations for an organization.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#get-default-code-security-configurations)

  """
  @spec get_default_configurations(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.CodeSecurityDefaultConfigurations.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_default_configurations(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.CodeSecurity, :get_default_configurations},
      url: "/orgs/#{org}/code-security/configurations/defaults",
      method: :get,
      response: [
        {200, [{GitHubOpenAPI.CodeSecurityDefaultConfigurations, :t}]},
        {304, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get default code security configurations for an enterprise

  Lists the default code security configurations for an enterprise.

  The authenticated user must be an administrator of the enterprise in order to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `read:enterprise` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#get-default-code-security-configurations-for-an-enterprise)

  """
  @spec get_default_configurations_for_enterprise(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.CodeSecurityDefaultConfigurations.t()]} | :error
  def get_default_configurations_for_enterprise(enterprise, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [enterprise: enterprise],
      call: {GitHubOpenAPI.CodeSecurity, :get_default_configurations_for_enterprise},
      url: "/enterprises/#{enterprise}/code-security/configurations/defaults",
      method: :get,
      response: [{200, [{GitHubOpenAPI.CodeSecurityDefaultConfigurations, :t}]}],
      opts: opts
    })
  end

  @doc """
  Get repositories associated with a code security configuration

  Lists the repositories associated with a code security configuration in an organization.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `status`: A comma-separated list of statuses. If specified, only repositories with these attachment statuses will be returned.
      
      Can be: `all`, `attached`, `attaching`, `detached`, `removed`, `enforced`, `failed`, `updating`, `removed_by_enterprise`

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#get-repositories-associated-with-a-code-security-configuration)

  """
  @spec get_repositories_for_configuration(String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.CodeSecurityConfigurationRepositories.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_repositories_for_configuration(org, configuration_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :per_page, :status])

    client.request(%{
      args: [org: org, configuration_id: configuration_id],
      call: {GitHubOpenAPI.CodeSecurity, :get_repositories_for_configuration},
      url: "/orgs/#{org}/code-security/configurations/#{configuration_id}/repositories",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.CodeSecurityConfigurationRepositories, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get repositories associated with an enterprise code security configuration

  Lists the repositories associated with an enterprise code security configuration in an organization.

  The authenticated user must be an administrator of the enterprise in order to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `read:enterprise` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `status`: A comma-separated list of statuses. If specified, only repositories with these attachment statuses will be returned.
      
      Can be: `all`, `attached`, `attaching`, `removed`, `enforced`, `failed`, `updating`, `removed_by_enterprise`

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#get-repositories-associated-with-an-enterprise-code-security-configuration)

  """
  @spec get_repositories_for_enterprise_configuration(String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.CodeSecurityConfigurationRepositories.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_repositories_for_enterprise_configuration(enterprise, configuration_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :per_page, :status])

    client.request(%{
      args: [enterprise: enterprise, configuration_id: configuration_id],
      call: {GitHubOpenAPI.CodeSecurity, :get_repositories_for_enterprise_configuration},
      url:
        "/enterprises/#{enterprise}/code-security/configurations/#{configuration_id}/repositories",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.CodeSecurityConfigurationRepositories, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a code security configuration of an enterprise

  Gets a code security configuration available in an enterprise.

  The authenticated user must be an administrator of the enterprise in order to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `read:enterprise` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#retrieve-a-code-security-configuration-of-an-enterprise)

  """
  @spec get_single_configuration_for_enterprise(String.t(), integer, keyword) ::
          {:ok, GitHubOpenAPI.CodeSecurityConfiguration.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_single_configuration_for_enterprise(enterprise, configuration_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [enterprise: enterprise, configuration_id: configuration_id],
      call: {GitHubOpenAPI.CodeSecurity, :get_single_configuration_for_enterprise},
      url: "/enterprises/#{enterprise}/code-security/configurations/#{configuration_id}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.CodeSecurityConfiguration, :t}},
        {304, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type set_configuration_as_default_200_json_resp :: %{
          __info__: map,
          configuration: GitHubOpenAPI.CodeSecurityConfiguration.t() | nil,
          default_for_new_repos: String.t() | nil
        }

  @doc """
  Set a code security configuration as a default for an organization

  Sets a code security configuration as a default to be applied to new repositories in your organization.

  This configuration will be applied to the matching repository type (all, none, public, private and internal) by default when they are created.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#set-a-code-security-configuration-as-a-default-for-an-organization)

  """
  @spec set_configuration_as_default(String.t(), integer, map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def set_configuration_as_default(org, configuration_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, configuration_id: configuration_id, body: body],
      call: {GitHubOpenAPI.CodeSecurity, :set_configuration_as_default},
      url: "/orgs/#{org}/code-security/configurations/#{configuration_id}/defaults",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.CodeSecurity, :set_configuration_as_default_200_json_resp}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type set_configuration_as_default_for_enterprise_200_json_resp :: %{
          __info__: map,
          configuration: GitHubOpenAPI.CodeSecurityConfiguration.t() | nil,
          default_for_new_repos: String.t() | nil
        }

  @doc """
  Set a code security configuration as a default for an enterprise

  Sets a code security configuration as a default to be applied to new repositories in your enterprise.

  This configuration will be applied by default to the matching repository type when created, but only for organizations within the enterprise that do not already have a default code security configuration set.

  The authenticated user must be an administrator for the enterprise to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#set-a-code-security-configuration-as-a-default-for-an-enterprise)

  """
  @spec set_configuration_as_default_for_enterprise(String.t(), integer, map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def set_configuration_as_default_for_enterprise(enterprise, configuration_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [enterprise: enterprise, configuration_id: configuration_id, body: body],
      call: {GitHubOpenAPI.CodeSecurity, :set_configuration_as_default_for_enterprise},
      url: "/enterprises/#{enterprise}/code-security/configurations/#{configuration_id}/defaults",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200,
         {GitHubOpenAPI.CodeSecurity, :set_configuration_as_default_for_enterprise_200_json_resp}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a code security configuration

  Updates a code security configuration in an organization.

  The authenticated user must be an administrator or security manager for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#update-a-code-security-configuration)

  """
  @spec update_configuration(String.t(), integer, map, keyword) ::
          {:ok, GitHubOpenAPI.CodeSecurityConfiguration.t()} | :error
  def update_configuration(org, configuration_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, configuration_id: configuration_id, body: body],
      call: {GitHubOpenAPI.CodeSecurity, :update_configuration},
      url: "/orgs/#{org}/code-security/configurations/#{configuration_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHubOpenAPI.CodeSecurityConfiguration, :t}}, {204, :null}],
      opts: opts
    })
  end

  @doc """
  Update a custom code security configuration for an enterprise

  Updates a code security configuration in an enterprise.

  The authenticated user must be an administrator of the enterprise in order to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/code-security/configurations#update-a-custom-code-security-configuration-for-an-enterprise)

  """
  @spec update_enterprise_configuration(String.t(), integer, map, keyword) ::
          {:ok, GitHubOpenAPI.CodeSecurityConfiguration.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def update_enterprise_configuration(enterprise, configuration_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [enterprise: enterprise, configuration_id: configuration_id, body: body],
      call: {GitHubOpenAPI.CodeSecurity, :update_enterprise_configuration},
      url: "/enterprises/#{enterprise}/code-security/configurations/#{configuration_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.CodeSecurityConfiguration, :t}},
        {304, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {409, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:set_configuration_as_default_200_json_resp) do
    [
      configuration: {GitHubOpenAPI.CodeSecurityConfiguration, :t},
      default_for_new_repos: {:enum, ["all", "none", "private_and_internal", "public"]}
    ]
  end

  def __fields__(:set_configuration_as_default_for_enterprise_200_json_resp) do
    [
      configuration: {GitHubOpenAPI.CodeSecurityConfiguration, :t},
      default_for_new_repos: {:enum, ["all", "none", "private_and_internal", "public"]}
    ]
  end
end
