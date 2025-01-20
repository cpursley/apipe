defmodule GitHubOpenAPI.PrivateRegistries do
  @moduledoc """
  Provides API endpoints related to private registries
  """

  @default_client GitHubOpenAPI.Client

  @doc """
  Create a private registry for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Creates a private registry configuration with an encrypted value for an organization. Encrypt your secret using [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see "[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/private-registries/organization-configurations#create-a-private-registry-for-an-organization)

  """
  @spec create_org_private_registry(String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.OrgPrivateRegistryConfigurationWithSelectedRepositories.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def create_org_private_registry(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.PrivateRegistries, :create_org_private_registry},
      url: "/orgs/#{org}/private-registries",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHubOpenAPI.OrgPrivateRegistryConfigurationWithSelectedRepositories, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a private registry for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Delete a private registry configuration at the organization-level.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/private-registries/organization-configurations#delete-a-private-registry-for-an-organization)

  """
  @spec delete_org_private_registry(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ScimError.t()}
  def delete_org_private_registry(org, secret_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, secret_name: secret_name],
      call: {GitHubOpenAPI.PrivateRegistries, :delete_org_private_registry},
      url: "/orgs/#{org}/private-registries/#{secret_name}",
      method: :delete,
      response: [
        {204, :null},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a private registry for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Get the configuration of a single private registry defined for an organization, omitting its encrypted value.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/private-registries/organization-configurations#get-a-private-registry-for-an-organization)

  """
  @spec get_org_private_registry(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.OrgPrivateRegistryConfiguration.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_org_private_registry(org, secret_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, secret_name: secret_name],
      call: {GitHubOpenAPI.PrivateRegistries, :get_org_private_registry},
      url: "/orgs/#{org}/private-registries/#{secret_name}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.OrgPrivateRegistryConfiguration, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type get_org_public_key_200_json_resp :: %{__info__: map, key: String.t(), key_id: String.t()}

  @doc """
  Get private registries public key for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Gets the org public key, which is needed to encrypt private registry secrets. You need to encrypt a secret before you can create or update secrets.

  OAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/private-registries/organization-configurations#get-private-registries-public-key-for-an-organization)

  """
  @spec get_org_public_key(String.t(), keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_org_public_key(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.PrivateRegistries, :get_org_public_key},
      url: "/orgs/#{org}/private-registries/public-key",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.PrivateRegistries, :get_org_public_key_200_json_resp}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type list_org_private_registries_200_json_resp :: %{
          __info__: map,
          configurations: [GitHubOpenAPI.OrgPrivateRegistryConfiguration.t()],
          total_count: integer
        }

  @doc """
  List private registries for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Lists all private registry configurations available at the organization-level without revealing their encrypted
  values.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/private-registries/organization-configurations#list-private-registries-for-an-organization)

  """
  @spec list_org_private_registries(String.t(), keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ScimError.t()}
  def list_org_private_registries(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.PrivateRegistries, :list_org_private_registries},
      url: "/orgs/#{org}/private-registries",
      method: :get,
      query: query,
      response: [
        {200, {GitHubOpenAPI.PrivateRegistries, :list_org_private_registries_200_json_resp}},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a private registry for an organization

  > [!NOTE]
  > This endpoint is in public preview and is subject to change.

  Updates a private registry configuration with an encrypted value for an organization. Encrypt your secret using [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see "[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/private-registries/organization-configurations#update-a-private-registry-for-an-organization)

  """
  @spec update_org_private_registry(String.t(), String.t(), map, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def update_org_private_registry(org, secret_name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, secret_name: secret_name, body: body],
      call: {GitHubOpenAPI.PrivateRegistries, :update_org_private_registry},
      url: "/orgs/#{org}/private-registries/#{secret_name}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_org_public_key_200_json_resp) do
    [key: {:string, :generic}, key_id: {:string, :generic}]
  end

  def __fields__(:list_org_private_registries_200_json_resp) do
    [configurations: [{GitHubOpenAPI.OrgPrivateRegistryConfiguration, :t}], total_count: :integer]
  end
end
