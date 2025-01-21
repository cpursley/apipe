defmodule GitHubOpenAPI.HostedCompute do
  @moduledoc """
  Provides API endpoints related to hosted compute
  """

  @default_client GitHubOpenAPI.Client

  @doc """
  Create a hosted compute network configuration for an organization

  Creates a hosted compute network configuration for an organization.

  OAuth app tokens and personal access tokens (classic) need the `write:network_configurations` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/settings/network-configurations#create-a-hosted-compute-network-configuration-for-an-organization)

  """
  @spec create_network_configuration_for_org(String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.NetworkConfiguration.t()} | :error
  def create_network_configuration_for_org(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.HostedCompute, :create_network_configuration_for_org},
      url: "/orgs/#{org}/settings/network-configurations",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GitHubOpenAPI.NetworkConfiguration, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a hosted compute network configuration from an organization

  Deletes a hosted compute network configuration from an organization.

  OAuth app tokens and personal access tokens (classic) need the `write:network_configurations` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/settings/network-configurations#delete-a-hosted-compute-network-configuration-from-an-organization)

  """
  @spec delete_network_configuration_from_org(String.t(), String.t(), keyword) :: :ok | :error
  def delete_network_configuration_from_org(org, network_configuration_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, network_configuration_id: network_configuration_id],
      call: {GitHubOpenAPI.HostedCompute, :delete_network_configuration_from_org},
      url: "/orgs/#{org}/settings/network-configurations/#{network_configuration_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Get a hosted compute network configuration for an organization

  Gets a hosted compute network configuration configured in an organization.

  OAuth app tokens and personal access tokens (classic) need the `read:network_configurations` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/settings/network-configurations#get-a-hosted-compute-network-configuration-for-an-organization)

  """
  @spec get_network_configuration_for_org(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.NetworkConfiguration.t()} | :error
  def get_network_configuration_for_org(org, network_configuration_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, network_configuration_id: network_configuration_id],
      call: {GitHubOpenAPI.HostedCompute, :get_network_configuration_for_org},
      url: "/orgs/#{org}/settings/network-configurations/#{network_configuration_id}",
      method: :get,
      response: [{200, {GitHubOpenAPI.NetworkConfiguration, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a hosted compute network settings resource for an organization

  Gets a hosted compute network settings resource configured for an organization.

  OAuth app tokens and personal access tokens (classic) need the `read:network_configurations` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/settings/network-configurations#get-a-hosted-compute-network-settings-resource-for-an-organization)

  """
  @spec get_network_settings_for_org(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.NetworkSettings.t()} | :error
  def get_network_settings_for_org(org, network_settings_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, network_settings_id: network_settings_id],
      call: {GitHubOpenAPI.HostedCompute, :get_network_settings_for_org},
      url: "/orgs/#{org}/settings/network-settings/#{network_settings_id}",
      method: :get,
      response: [{200, {GitHubOpenAPI.NetworkSettings, :t}}],
      opts: opts
    })
  end

  @type list_network_configurations_for_org_200_json_resp :: %{
          __info__: map,
          __joins__: map,
          network_configurations: [GitHubOpenAPI.NetworkConfiguration.t()],
          total_count: integer
        }

  @doc """
  List hosted compute network configurations for an organization

  Lists all hosted compute network configurations configured in an organization.

  OAuth app tokens and personal access tokens (classic) need the `read:network_configurations` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/settings/network-configurations#list-hosted-compute-network-configurations-for-an-organization)

  """
  @spec list_network_configurations_for_org(String.t(), keyword) :: {:ok, map} | :error
  def list_network_configurations_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.HostedCompute, :list_network_configurations_for_org},
      url: "/orgs/#{org}/settings/network-configurations",
      method: :get,
      query: query,
      response: [
        {200, {GitHubOpenAPI.HostedCompute, :list_network_configurations_for_org_200_json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a hosted compute network configuration for an organization

  Updates a hosted compute network configuration for an organization.

  OAuth app tokens and personal access tokens (classic) need the `write:network_configurations` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/settings/network-configurations#update-a-hosted-compute-network-configuration-for-an-organization)

  """
  @spec update_network_configuration_for_org(String.t(), String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.NetworkConfiguration.t()} | :error
  def update_network_configuration_for_org(org, network_configuration_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, network_configuration_id: network_configuration_id, body: body],
      call: {GitHubOpenAPI.HostedCompute, :update_network_configuration_for_org},
      url: "/orgs/#{org}/settings/network-configurations/#{network_configuration_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHubOpenAPI.NetworkConfiguration, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_network_configurations_for_org_200_json_resp) do
    [network_configurations: [{GitHubOpenAPI.NetworkConfiguration, :t}], total_count: :integer]
  end
end
