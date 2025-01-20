defmodule GitHubOpenAPI.Orgs do
  @moduledoc """
  Provides API endpoints related to orgs
  """

  @default_client GitHubOpenAPI.Client

  @doc """
  Add a security manager team

  > [!WARNING]
  > **Closing down notice:** This operation is closing down and will be removed starting January 1, 2026. Please use the "[Organization Roles](https://docs.github.com/rest/orgs/organization-roles)" endpoints instead.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/security-managers#add-a-security-manager-team)

  """
  @spec add_security_manager_team(String.t(), String.t(), keyword) :: :ok | :error
  def add_security_manager_team(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHubOpenAPI.Orgs, :add_security_manager_team},
      url: "/orgs/#{org}/security-managers/teams/#{team_slug}",
      method: :put,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Assign an organization role to a team

  Assigns an organization role to a team in an organization. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  The authenticated user must be an administrator for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#assign-an-organization-role-to-a-team)

  """
  @spec assign_team_to_org_role(String.t(), String.t(), integer, keyword) :: :ok | :error
  def assign_team_to_org_role(org, team_slug, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, role_id: role_id],
      call: {GitHubOpenAPI.Orgs, :assign_team_to_org_role},
      url: "/orgs/#{org}/organization-roles/teams/#{team_slug}/#{role_id}",
      method: :put,
      response: [{204, :null}, {404, :null}, {422, :null}],
      opts: opts
    })
  end

  @doc """
  Assign an organization role to a user

  Assigns an organization role to a member of an organization. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  The authenticated user must be an administrator for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#assign-an-organization-role-to-a-user)

  """
  @spec assign_user_to_org_role(String.t(), String.t(), integer, keyword) :: :ok | :error
  def assign_user_to_org_role(org, username, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username, role_id: role_id],
      call: {GitHubOpenAPI.Orgs, :assign_user_to_org_role},
      url: "/orgs/#{org}/organization-roles/users/#{username}/#{role_id}",
      method: :put,
      response: [{204, :null}, {404, :null}, {422, :null}],
      opts: opts
    })
  end

  @doc """
  Block a user from an organization

  Blocks the given user on behalf of the specified organization and returns a 204. If the organization cannot block the given user a 422 is returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/blocking#block-a-user-from-an-organization)

  """
  @spec block_user(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.ValidationError.t()}
  def block_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :block_user},
      url: "/orgs/#{org}/blocks/#{username}",
      method: :put,
      response: [{204, :null}, {422, {GitHubOpenAPI.ValidationError, :t}}],
      opts: opts
    })
  end

  @doc """
  Cancel an organization invitation

  Cancel an organization invitation. In order to cancel an organization invitation, the authenticated user must be an organization owner.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#cancel-an-organization-invitation)

  """
  @spec cancel_invitation(String.t(), integer, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def cancel_invitation(org, invitation_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, invitation_id: invitation_id],
      call: {GitHubOpenAPI.Orgs, :cancel_invitation},
      url: "/orgs/#{org}/invitations/#{invitation_id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Check if a user is blocked by an organization

  Returns a 204 if the given user is blocked by the given organization. Returns a 404 if the organization is not blocking the user, or if the user account has been identified as spam by GitHub.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/blocking#check-if-a-user-is-blocked-by-an-organization)

  """
  @spec check_blocked_user(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def check_blocked_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :check_blocked_user},
      url: "/orgs/#{org}/blocks/#{username}",
      method: :get,
      response: [{204, :null}, {404, {GitHubOpenAPI.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Check organization membership for a user

  Check if a user is, publicly or privately, a member of the organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#check-organization-membership-for-a-user)

  """
  @spec check_membership_for_user(String.t(), String.t(), keyword) :: :ok | :error
  def check_membership_for_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :check_membership_for_user},
      url: "/orgs/#{org}/members/#{username}",
      method: :get,
      response: [{204, :null}, {302, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Check public organization membership for a user

  Check if the provided user is a public member of the organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#check-public-organization-membership-for-a-user)

  """
  @spec check_public_membership_for_user(String.t(), String.t(), keyword) :: :ok | :error
  def check_public_membership_for_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :check_public_membership_for_user},
      url: "/orgs/#{org}/public_members/#{username}",
      method: :get,
      response: [{204, :null}, {404, :null}],
      opts: opts
    })
  end

  @type convert_member_to_outside_collaborator_202_json_resp :: %{__info__: map}

  @doc """
  Convert an organization member to outside collaborator

  When an organization member is converted to an outside collaborator, they'll only have access to the repositories that their current team membership allows. The user will no longer be a member of the organization. For more information, see "[Converting an organization member to an outside collaborator](https://docs.github.com/articles/converting-an-organization-member-to-an-outside-collaborator/)". Converting an organization member to an outside collaborator may be restricted by enterprise administrators. For more information, see "[Enforcing repository management policies in your enterprise](https://docs.github.com/admin/policies/enforcing-policies-for-your-enterprise/enforcing-repository-management-policies-in-your-enterprise#enforcing-a-policy-for-inviting-outside-collaborators-to-repositories)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/outside-collaborators#convert-an-organization-member-to-outside-collaborator)

  """
  @spec convert_member_to_outside_collaborator(String.t(), String.t(), map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def convert_member_to_outside_collaborator(org, username, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username, body: body],
      call: {GitHubOpenAPI.Orgs, :convert_member_to_outside_collaborator},
      url: "/orgs/#{org}/outside_collaborators/#{username}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {202, {GitHubOpenAPI.Orgs, :convert_member_to_outside_collaborator_202_json_resp}},
        {204, :null},
        {403, :null},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create an organization invitation

  Invite people to an organization by using their GitHub user ID or their email address. In order to create invitations in an organization, the authenticated user must be an organization owner.

  This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#create-an-organization-invitation)

  """
  @spec create_invitation(String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.OrganizationInvitation.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def create_invitation(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Orgs, :create_invitation},
      url: "/orgs/#{org}/invitations",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHubOpenAPI.OrganizationInvitation, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create or update custom properties for an organization

  Creates new or updates existing custom properties defined for an organization in a batch.

  To use this endpoint, the authenticated user must be one of:
    - An administrator for the organization.
    - A user, or a user on a team, with the fine-grained permission of `custom_properties_org_definitions_manager` in the organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/custom-properties#create-or-update-custom-properties-for-an-organization)

  """
  @spec create_or_update_custom_properties(String.t(), map, keyword) ::
          {:ok, [GitHubOpenAPI.CustomProperty.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def create_or_update_custom_properties(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Orgs, :create_or_update_custom_properties},
      url: "/orgs/#{org}/properties/schema",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, [{GitHubOpenAPI.CustomProperty, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create or update custom property values for organization repositories

  Create new or update existing custom property values for repositories in a batch that belong to an organization.
  Each target repository will have its custom property values updated to match the values provided in the request.

  A maximum of 30 repositories can be updated in a single request.

  Using a value of `null` for a custom property will remove or 'unset' the property value from the repository.

  To use this endpoint, the authenticated user must be one of:
    - An administrator for the organization.
    - A user, or a user on a team, with the fine-grained permission of `custom_properties_org_values_editor` in the organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/custom-properties#create-or-update-custom-property-values-for-organization-repositories)

  """
  @spec create_or_update_custom_properties_values_for_repos(String.t(), map, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def create_or_update_custom_properties_values_for_repos(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Orgs, :create_or_update_custom_properties_values_for_repos},
      url: "/orgs/#{org}/properties/values",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create or update a custom property for an organization

  Creates a new or updates an existing custom property that is defined for an organization.

  To use this endpoint, the authenticated user must be one of:
  - An administrator for the organization.
  - A user, or a user on a team, with the fine-grained permission of `custom_properties_org_definitions_manager` in the organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/custom-properties#create-or-update-a-custom-property-for-an-organization)

  """
  @spec create_or_update_custom_property(
          String.t(),
          String.t(),
          GitHubOpenAPI.CustomPropertySetPayload.t(),
          keyword
        ) :: {:ok, GitHubOpenAPI.CustomProperty.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def create_or_update_custom_property(org, custom_property_name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, custom_property_name: custom_property_name, body: body],
      call: {GitHubOpenAPI.Orgs, :create_or_update_custom_property},
      url: "/orgs/#{org}/properties/schema/#{custom_property_name}",
      body: body,
      method: :put,
      request: [{"application/json", {GitHubOpenAPI.CustomPropertySetPayload, :t}}],
      response: [
        {200, {GitHubOpenAPI.CustomProperty, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create an organization webhook

  Create a hook that posts payloads in JSON format.

  You must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or
  edit webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#create-an-organization-webhook)

  """
  @spec create_webhook(String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.OrgHook.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def create_webhook(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Orgs, :create_webhook},
      url: "/orgs/#{org}/hooks",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHubOpenAPI.OrgHook, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an organization

  Deletes an organization and all its repositories.

  The organization login will be unavailable for 90 days after deletion.

  Please review the Terms of Service regarding account deletion before using this endpoint:

  https://docs.github.com/site-policy/github-terms/github-terms-of-service

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/orgs#delete-an-organization)

  """
  @spec delete(String.t(), keyword) :: {:ok, map} | {:error, GitHubOpenAPI.BasicError.t()}
  def delete(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :delete},
      url: "/orgs/#{org}",
      method: :delete,
      response: [
        {202, :map},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an organization webhook

  Delete a webhook for an organization.

  The authenticated user must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#delete-an-organization-webhook)

  """
  @spec delete_webhook(String.t(), integer, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def delete_webhook(org, hook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, hook_id: hook_id],
      call: {GitHubOpenAPI.Orgs, :delete_webhook},
      url: "/orgs/#{org}/hooks/#{hook_id}",
      method: :delete,
      response: [{204, :null}, {404, {GitHubOpenAPI.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Enable or disable a security feature for an organization

  > [!WARNING]
  > **Closing down notice:** The ability to enable or disable a security feature for all eligible repositories in an organization is closing down. Please use [code security configurations](https://docs.github.com/rest/code-security/configurations) instead. For more information, see the [changelog](https://github.blog/changelog/2024-07-22-deprecation-of-api-endpoint-to-enable-or-disable-a-security-feature-for-an-organization/).

  Enables or disables the specified security feature for all eligible repositories in an organization. For more information, see "[Managing security managers in your organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."

  The authenticated user must be an organization owner or be member of a team with the security manager role to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:org`, `write:org`, or `repo` scopes to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/orgs#enable-or-disable-a-security-feature-for-an-organization)

  """
  @spec enable_or_disable_security_product_on_all_org_repos(
          String.t(),
          String.t(),
          String.t(),
          map,
          keyword
        ) :: :ok | :error
  def enable_or_disable_security_product_on_all_org_repos(
        org,
        security_product,
        enablement,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, security_product: security_product, enablement: enablement, body: body],
      call: {GitHubOpenAPI.Orgs, :enable_or_disable_security_product_on_all_org_repos},
      url: "/orgs/#{org}/#{security_product}/#{enablement}",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{204, :null}, {422, :null}],
      opts: opts
    })
  end

  @doc """
  Get an organization

  Gets information about an organization.

  When the value of `two_factor_requirement_enabled` is `true`, the organization requires all members, billing managers, and outside collaborators to enable [two-factor authentication](https://docs.github.com/articles/securing-your-account-with-two-factor-authentication-2fa/).

  To see the full details about an organization, the authenticated user must be an organization owner.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to see the full details about an organization.

  To see information about an organization's GitHub plan, GitHub Apps need the `Organization plan` permission.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/orgs#get-an-organization)

  """
  @spec get(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.OrganizationFull.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :get},
      url: "/orgs/#{org}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.OrganizationFull, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get all custom properties for an organization

  Gets all custom properties defined for an organization.
  Organization members can read these properties.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/custom-properties#get-all-custom-properties-for-an-organization)

  """
  @spec get_all_custom_properties(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.CustomProperty.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_all_custom_properties(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :get_all_custom_properties},
      url: "/orgs/#{org}/properties/schema",
      method: :get,
      response: [
        {200, [{GitHubOpenAPI.CustomProperty, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a custom property for an organization

  Gets a custom property that is defined for an organization.
  Organization members can read these properties.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/custom-properties#get-a-custom-property-for-an-organization)

  """
  @spec get_custom_property(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.CustomProperty.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_custom_property(org, custom_property_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, custom_property_name: custom_property_name],
      call: {GitHubOpenAPI.Orgs, :get_custom_property},
      url: "/orgs/#{org}/properties/schema/#{custom_property_name}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.CustomProperty, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get an organization membership for the authenticated user

  If the authenticated user is an active or pending member of the organization, this endpoint will return the user's membership. If the authenticated user is not affiliated with the organization, a `404` is returned. This endpoint will return a `403` if the request is made by a GitHub App that is blocked by the organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#get-an-organization-membership-for-the-authenticated-user)

  """
  @spec get_membership_for_authenticated_user(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.OrgMembership.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_membership_for_authenticated_user(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :get_membership_for_authenticated_user},
      url: "/user/memberships/orgs/#{org}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.OrgMembership, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get organization membership for a user

  In order to get a user's membership with an organization, the authenticated user must be an organization member. The `state` parameter in the response can be used to identify the user's membership status.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#get-organization-membership-for-a-user)

  """
  @spec get_membership_for_user(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.OrgMembership.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_membership_for_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :get_membership_for_user},
      url: "/orgs/#{org}/memberships/#{username}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.OrgMembership, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get an organization role

  Gets an organization role that is available to this organization. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  To use this endpoint, the authenticated user must be one of:

  - An administrator for the organization.
  - A user, or a user on a team, with the fine-grained permissions of `read_organization_custom_org_role` in the organization.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#get-an-organization-role)

  """
  @spec get_org_role(String.t(), integer, keyword) ::
          {:ok, GitHubOpenAPI.OrganizationRole.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def get_org_role(org, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, role_id: role_id],
      call: {GitHubOpenAPI.Orgs, :get_org_role},
      url: "/orgs/#{org}/organization-roles/#{role_id}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.OrganizationRole, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

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
      call: {GitHubOpenAPI.Orgs, :get_route_stats_by_actor},
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
      call: {GitHubOpenAPI.Orgs, :get_subject_stats},
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
      call: {GitHubOpenAPI.Orgs, :get_summary_stats},
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
      call: {GitHubOpenAPI.Orgs, :get_summary_stats_by_actor},
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
      call: {GitHubOpenAPI.Orgs, :get_summary_stats_by_user},
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
      call: {GitHubOpenAPI.Orgs, :get_time_stats},
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
      call: {GitHubOpenAPI.Orgs, :get_time_stats_by_actor},
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
      call: {GitHubOpenAPI.Orgs, :get_time_stats_by_user},
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
      call: {GitHubOpenAPI.Orgs, :get_user_stats},
      url: "/orgs/#{org}/insights/api/user-stats/#{user_id}",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.ApiInsightsUserStats, :t}]}],
      opts: opts
    })
  end

  @doc """
  Get an organization webhook

  Returns a webhook configured in an organization. To get only the webhook
  `config` properties, see "[Get a webhook configuration for an organization](/rest/orgs/webhooks#get-a-webhook-configuration-for-an-organization).

  You must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#get-an-organization-webhook)

  """
  @spec get_webhook(String.t(), integer, keyword) ::
          {:ok, GitHubOpenAPI.OrgHook.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_webhook(org, hook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, hook_id: hook_id],
      call: {GitHubOpenAPI.Orgs, :get_webhook},
      url: "/orgs/#{org}/hooks/#{hook_id}",
      method: :get,
      response: [{200, {GitHubOpenAPI.OrgHook, :t}}, {404, {GitHubOpenAPI.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a webhook configuration for an organization

  Returns the webhook configuration for an organization. To get more information about the webhook, including the `active` state and `events`, use "[Get an organization webhook ](/rest/orgs/webhooks#get-an-organization-webhook)."

  You must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#get-a-webhook-configuration-for-an-organization)

  """
  @spec get_webhook_config_for_org(String.t(), integer, keyword) ::
          {:ok, GitHubOpenAPI.WebhookConfig.t()} | :error
  def get_webhook_config_for_org(org, hook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, hook_id: hook_id],
      call: {GitHubOpenAPI.Orgs, :get_webhook_config_for_org},
      url: "/orgs/#{org}/hooks/#{hook_id}/config",
      method: :get,
      response: [{200, {GitHubOpenAPI.WebhookConfig, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a webhook delivery for an organization webhook

  Returns a delivery for a webhook configured in an organization.

  You must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#get-a-webhook-delivery-for-an-organization-webhook)

  """
  @spec get_webhook_delivery(String.t(), integer, integer, keyword) ::
          {:ok, GitHubOpenAPI.HookDelivery.t()}
          | {:error,
             GitHubOpenAPI.BasicError.t()
             | GitHubOpenAPI.ScimError.t()
             | GitHubOpenAPI.ValidationError.t()}
  def get_webhook_delivery(org, hook_id, delivery_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, hook_id: hook_id, delivery_id: delivery_id],
      call: {GitHubOpenAPI.Orgs, :get_webhook_delivery},
      url: "/orgs/#{org}/hooks/#{hook_id}/deliveries/#{delivery_id}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.HookDelivery, :t}},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List organizations

  Lists all organizations, in the order that they were created.

  > [!NOTE]
  > Pagination is powered exclusively by the `since` parameter. Use the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers) to get the URL for the next page of organizations.

  ## Options

    * `since`: An organization ID. Only return organizations with an ID greater than this ID.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/orgs#list-organizations)

  """
  @spec list(keyword) :: {:ok, [GitHubOpenAPI.OrganizationSimple.t()]} | :error
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:per_page, :since])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Orgs, :list},
      url: "/organizations",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.OrganizationSimple, :t}]}, {304, :null}],
      opts: opts
    })
  end

  @type list_app_installations_200_json_resp :: %{
          __info__: map,
          installations: [GitHubOpenAPI.Installation.t()],
          total_count: integer
        }

  @doc """
  List app installations for an organization

  Lists all GitHub Apps in an organization. The installation count includes
  all GitHub Apps installed on repositories in the organization.

  The authenticated user must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:read` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/orgs#list-app-installations-for-an-organization)

  """
  @spec list_app_installations(String.t(), keyword) :: {:ok, map} | :error
  def list_app_installations(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_app_installations},
      url: "/orgs/#{org}/installations",
      method: :get,
      query: query,
      response: [{200, {GitHubOpenAPI.Orgs, :list_app_installations_200_json_resp}}],
      opts: opts
    })
  end

  @type list_attestations_200_json_resp :: %{
          __info__: map,
          attestations: [GitHubOpenAPI.OrgsAttestations.list_attestations_200_json_resp()] | nil
        }

  @doc """
  List attestations

  List a collection of artifact attestations with a given subject digest that are associated with repositories owned by an organization.

  The collection of attestations returned by this endpoint is filtered according to the authenticated user's permissions; if the authenticated user cannot read a repository, the attestations associated with that repository will not be included in the response. In addition, when using a fine-grained access token the `attestations:read` permission is required.

  **Please note:** in order to offer meaningful security benefits, an attestation's signature and timestamps **must** be cryptographically verified, and the identity of the attestation signer **must** be validated. Attestations can be verified using the [GitHub CLI `attestation verify` command](https://cli.github.com/manual/gh_attestation_verify). For more information, see [our guide on how to use artifact attestations to establish a build's provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds).

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/orgs#list-attestations)

  """
  @spec list_attestations(String.t(), String.t(), keyword) :: {:ok, map} | :error
  def list_attestations(org, subject_digest, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :per_page])

    client.request(%{
      args: [org: org, subject_digest: subject_digest],
      call: {GitHubOpenAPI.Orgs, :list_attestations},
      url: "/orgs/#{org}/attestations/#{subject_digest}",
      method: :get,
      query: query,
      response: [{200, {GitHubOpenAPI.Orgs, :list_attestations_200_json_resp}}],
      opts: opts
    })
  end

  @doc """
  List users blocked by an organization

  List the users blocked by an organization.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/blocking#list-users-blocked-by-an-organization)

  """
  @spec list_blocked_users(String.t(), keyword) :: {:ok, [GitHubOpenAPI.SimpleUser.t()]} | :error
  def list_blocked_users(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_blocked_users},
      url: "/orgs/#{org}/blocks",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.SimpleUser, :t}]}],
      opts: opts
    })
  end

  @doc """
  List custom property values for organization repositories

  Lists organization repositories with all of their custom property values.
  Organization members can read these properties.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `repository_query`: Finds repositories in the organization with a query containing one or more search keywords and qualifiers. Qualifiers allow you to limit your search to specific areas of GitHub. The REST API supports the same qualifiers as the web interface for GitHub. To learn more about the format of the query, see [Constructing a search query](https://docs.github.com/rest/search/search#constructing-a-search-query). See "[Searching for repositories](https://docs.github.com/articles/searching-for-repositories/)" for a detailed list of qualifiers.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/custom-properties#list-custom-property-values-for-organization-repositories)

  """
  @spec list_custom_properties_values_for_repos(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.OrgRepoCustomPropertyValues.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def list_custom_properties_values_for_repos(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :repository_query])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_custom_properties_values_for_repos},
      url: "/orgs/#{org}/properties/values",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.OrgRepoCustomPropertyValues, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List failed organization invitations

  The return hash contains `failed_at` and `failed_reason` fields which represent the time at which the invitation failed and the reason for the failure.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#list-failed-organization-invitations)

  """
  @spec list_failed_invitations(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.OrganizationInvitation.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def list_failed_invitations(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_failed_invitations},
      url: "/orgs/#{org}/failed_invitations",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.OrganizationInvitation, :t}]},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List organizations for the authenticated user

  List organizations for the authenticated user.

  For OAuth app tokens and personal access tokens (classic), this endpoint only lists organizations that your authorization allows you to operate on in some way (e.g., you can list teams with `read:org` scope, you can publicize your organization membership with `user` scope, etc.). Therefore, this API requires at least `user` or `read:org` scope for OAuth app tokens and personal access tokens (classic). Requests with insufficient scope will receive a `403 Forbidden` response.

  > [!NOTE]
  > Requests using a fine-grained access token will receive a `200 Success` response with an empty list.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/orgs#list-organizations-for-the-authenticated-user)

  """
  @spec list_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.OrganizationSimple.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Orgs, :list_for_authenticated_user},
      url: "/user/orgs",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.OrganizationSimple, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List organizations for a user

  List [public organization memberships](https://docs.github.com/articles/publicizing-or-concealing-organization-membership) for the specified user.

  This method only lists _public_ memberships, regardless of authentication. If you need to fetch all of the organization memberships (public and private) for the authenticated user, use the [List organizations for the authenticated user](https://docs.github.com/rest/orgs/orgs#list-organizations-for-the-authenticated-user) API instead.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/orgs#list-organizations-for-a-user)

  """
  @spec list_for_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.OrganizationSimple.t()]} | :error
  def list_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Orgs, :list_for_user},
      url: "/users/#{username}/orgs",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.OrganizationSimple, :t}]}],
      opts: opts
    })
  end

  @doc """
  List organization invitation teams

  List all teams associated with an invitation. In order to see invitations in an organization, the authenticated user must be an organization owner.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#list-organization-invitation-teams)

  """
  @spec list_invitation_teams(String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.Team.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_invitation_teams(org, invitation_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, invitation_id: invitation_id],
      call: {GitHubOpenAPI.Orgs, :list_invitation_teams},
      url: "/orgs/#{org}/invitations/#{invitation_id}/teams",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.Team, :t}]}, {404, {GitHubOpenAPI.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List organization members

  List all users who are members of an organization. If the authenticated user is also a member of this organization then both concealed and public members will be returned.

  ## Options

    * `filter`: Filter members returned in the list. `2fa_disabled` means that only members without [two-factor authentication](https://github.com/blog/1614-two-factor-authentication) enabled will be returned. This options is only available for organization owners.
    * `role`: Filter members returned by their role.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#list-organization-members)

  """
  @spec list_members(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.SimpleUser.t()]} | {:error, GitHubOpenAPI.ValidationError.t()}
  def list_members(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filter, :page, :per_page, :role])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_members},
      url: "/orgs/#{org}/members",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.SimpleUser, :t}]},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List organization memberships for the authenticated user

  Lists all of the authenticated user's organization memberships.

  ## Options

    * `state`: Indicates the state of the memberships to return. If not specified, the API returns both active and pending memberships.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#list-organization-memberships-for-the-authenticated-user)

  """
  @spec list_memberships_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.OrgMembership.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def list_memberships_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :state])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Orgs, :list_memberships_for_authenticated_user},
      url: "/user/memberships/orgs",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.OrgMembership, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List teams that are assigned to an organization role

  Lists the teams that are assigned to an organization role. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  To use this endpoint, you must be an administrator for the organization.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#list-teams-that-are-assigned-to-an-organization-role)

  """
  @spec list_org_role_teams(String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.TeamRoleAssignment.t()]} | :error
  def list_org_role_teams(org, role_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, role_id: role_id],
      call: {GitHubOpenAPI.Orgs, :list_org_role_teams},
      url: "/orgs/#{org}/organization-roles/#{role_id}/teams",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.TeamRoleAssignment, :t}]}, {404, :null}, {422, :null}],
      opts: opts
    })
  end

  @doc """
  List users that are assigned to an organization role

  Lists organization members that are assigned to an organization role. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  To use this endpoint, you must be an administrator for the organization.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#list-users-that-are-assigned-to-an-organization-role)

  """
  @spec list_org_role_users(String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.UserRoleAssignment.t()]} | :error
  def list_org_role_users(org, role_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, role_id: role_id],
      call: {GitHubOpenAPI.Orgs, :list_org_role_users},
      url: "/orgs/#{org}/organization-roles/#{role_id}/users",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.UserRoleAssignment, :t}]}, {404, :null}, {422, :null}],
      opts: opts
    })
  end

  @type list_org_roles_200_json_resp :: %{
          __info__: map,
          roles: [GitHubOpenAPI.OrganizationRole.t()] | nil,
          total_count: integer | nil
        }

  @doc """
  Get all organization roles for an organization

  Lists the organization roles available in this organization. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  To use this endpoint, the authenticated user must be one of:

  - An administrator for the organization.
  - A user, or a user on a team, with the fine-grained permissions of `read_organization_custom_org_role` in the organization.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#get-all-organization-roles-for-an-organization)

  """
  @spec list_org_roles(String.t(), keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def list_org_roles(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_org_roles},
      url: "/orgs/#{org}/organization-roles",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.Orgs, :list_org_roles_200_json_resp}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List outside collaborators for an organization

  List all users who are outside collaborators of an organization.

  ## Options

    * `filter`: Filter the list of outside collaborators. `2fa_disabled` means that only outside collaborators without [two-factor authentication](https://github.com/blog/1614-two-factor-authentication) enabled will be returned.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/outside-collaborators#list-outside-collaborators-for-an-organization)

  """
  @spec list_outside_collaborators(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.SimpleUser.t()]} | :error
  def list_outside_collaborators(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filter, :page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_outside_collaborators},
      url: "/orgs/#{org}/outside_collaborators",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.SimpleUser, :t}]}],
      opts: opts
    })
  end

  @doc """
  List repositories a fine-grained personal access token has access to

  Lists the repositories a fine-grained personal access token has access to.

  Only GitHub Apps can use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/personal-access-tokens#list-repositories-a-fine-grained-personal-access-token-has-access-to)

  """
  @spec list_pat_grant_repositories(String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.MinimalRepository.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_pat_grant_repositories(org, pat_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, pat_id: pat_id],
      call: {GitHubOpenAPI.Orgs, :list_pat_grant_repositories},
      url: "/orgs/#{org}/personal-access-tokens/#{pat_id}/repositories",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.MinimalRepository, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List repositories requested to be accessed by a fine-grained personal access token

  Lists the repositories a fine-grained personal access token request is requesting access to.

  Only GitHub Apps can use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/personal-access-tokens#list-repositories-requested-to-be-accessed-by-a-fine-grained-personal-access-token)

  """
  @spec list_pat_grant_request_repositories(String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.MinimalRepository.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_pat_grant_request_repositories(org, pat_request_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org, pat_request_id: pat_request_id],
      call: {GitHubOpenAPI.Orgs, :list_pat_grant_request_repositories},
      url: "/orgs/#{org}/personal-access-token-requests/#{pat_request_id}/repositories",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.MinimalRepository, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List requests to access organization resources with fine-grained personal access tokens

  Lists requests from organization members to access organization resources with a fine-grained personal access token.

  Only GitHub Apps can use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `sort`: The property by which to sort the results.
    * `direction`: The direction to sort the results by.
    * `owner`: A list of owner usernames to use to filter the results.
    * `repository`: The name of the repository to use to filter the results.
    * `permission`: The permission to use to filter the results.
    * `last_used_before`: Only show fine-grained personal access tokens used before the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `last_used_after`: Only show fine-grained personal access tokens used after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/personal-access-tokens#list-requests-to-access-organization-resources-with-fine-grained-personal-access-tokens)

  """
  @spec list_pat_grant_requests(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequest.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def list_pat_grant_requests(org, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :direction,
        :last_used_after,
        :last_used_before,
        :owner,
        :page,
        :per_page,
        :permission,
        :repository,
        :sort
      ])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_pat_grant_requests},
      url: "/orgs/#{org}/personal-access-token-requests",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.OrganizationProgrammaticAccessGrantRequest, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List fine-grained personal access tokens with access to organization resources

  Lists approved fine-grained personal access tokens owned by organization members that can access organization resources.

  Only GitHub Apps can use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `sort`: The property by which to sort the results.
    * `direction`: The direction to sort the results by.
    * `owner`: A list of owner usernames to use to filter the results.
    * `repository`: The name of the repository to use to filter the results.
    * `permission`: The permission to use to filter the results.
    * `last_used_before`: Only show fine-grained personal access tokens used before the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
    * `last_used_after`: Only show fine-grained personal access tokens used after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/personal-access-tokens#list-fine-grained-personal-access-tokens-with-access-to-organization-resources)

  """
  @spec list_pat_grants(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.OrganizationProgrammaticAccessGrant.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def list_pat_grants(org, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :direction,
        :last_used_after,
        :last_used_before,
        :owner,
        :page,
        :per_page,
        :permission,
        :repository,
        :sort
      ])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_pat_grants},
      url: "/orgs/#{org}/personal-access-tokens",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.OrganizationProgrammaticAccessGrant, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List pending organization invitations

  The return hash contains a `role` field which refers to the Organization
  Invitation role and will be one of the following values: `direct_member`, `admin`,
  `billing_manager`, or `hiring_manager`. If the invitee is not a GitHub
  member, the `login` field in the return hash will be `null`.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `role`: Filter invitations by their member role.
    * `invitation_source`: Filter invitations by their invitation source.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#list-pending-organization-invitations)

  """
  @spec list_pending_invitations(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.OrganizationInvitation.t()]}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def list_pending_invitations(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:invitation_source, :page, :per_page, :role])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_pending_invitations},
      url: "/orgs/#{org}/invitations",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.OrganizationInvitation, :t}]},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List public organization members

  Members of an organization can choose to have their membership publicized or not.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#list-public-organization-members)

  """
  @spec list_public_members(String.t(), keyword) :: {:ok, [GitHubOpenAPI.SimpleUser.t()]} | :error
  def list_public_members(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_public_members},
      url: "/orgs/#{org}/public_members",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.SimpleUser, :t}]}],
      opts: opts
    })
  end

  @doc """
  List security manager teams

  > [!WARNING]
  > **Closing down notice:** This operation is closing down and will be removed starting January 1, 2026. Please use the "[Organization Roles](https://docs.github.com/rest/orgs/organization-roles)" endpoints instead.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/security-managers#list-security-manager-teams)

  """
  @spec list_security_manager_teams(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.TeamSimple.t()]} | :error
  def list_security_manager_teams(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_security_manager_teams},
      url: "/orgs/#{org}/security-managers",
      method: :get,
      response: [{200, [{GitHubOpenAPI.TeamSimple, :t}]}],
      opts: opts
    })
  end

  @doc """
  List deliveries for an organization webhook

  Returns a list of webhook deliveries for a webhook configured in an organization.

  You must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `cursor`: Used for pagination: the starting delivery from which the page of deliveries is fetched. Refer to the `link` header for the next and previous page cursors.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#list-deliveries-for-an-organization-webhook)

  """
  @spec list_webhook_deliveries(String.t(), integer, keyword) ::
          {:ok, [GitHubOpenAPI.HookDeliveryItem.t()]}
          | {:error,
             GitHubOpenAPI.BasicError.t()
             | GitHubOpenAPI.ScimError.t()
             | GitHubOpenAPI.ValidationError.t()}
  def list_webhook_deliveries(org, hook_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :per_page])

    client.request(%{
      args: [org: org, hook_id: hook_id],
      call: {GitHubOpenAPI.Orgs, :list_webhook_deliveries},
      url: "/orgs/#{org}/hooks/#{hook_id}/deliveries",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.HookDeliveryItem, :t}]},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List organization webhooks

  List webhooks for an organization.

  The authenticated user must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#list-organization-webhooks)

  """
  @spec list_webhooks(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.OrgHook.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_webhooks(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [org: org],
      call: {GitHubOpenAPI.Orgs, :list_webhooks},
      url: "/orgs/#{org}/hooks",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.OrgHook, :t}]}, {404, {GitHubOpenAPI.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Ping an organization webhook

  This will trigger a [ping event](https://docs.github.com/webhooks/#ping-event)
  to be sent to the hook.

  You must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#ping-an-organization-webhook)

  """
  @spec ping_webhook(String.t(), integer, keyword) :: :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def ping_webhook(org, hook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, hook_id: hook_id],
      call: {GitHubOpenAPI.Orgs, :ping_webhook},
      url: "/orgs/#{org}/hooks/#{hook_id}/pings",
      method: :post,
      response: [{204, :null}, {404, {GitHubOpenAPI.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Redeliver a delivery for an organization webhook

  Redeliver a delivery for a webhook configured in an organization.

  You must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#redeliver-a-delivery-for-an-organization-webhook)

  """
  @spec redeliver_webhook_delivery(String.t(), integer, integer, keyword) ::
          {:ok, map}
          | {:error,
             GitHubOpenAPI.BasicError.t()
             | GitHubOpenAPI.ScimError.t()
             | GitHubOpenAPI.ValidationError.t()}
  def redeliver_webhook_delivery(org, hook_id, delivery_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, hook_id: hook_id, delivery_id: delivery_id],
      call: {GitHubOpenAPI.Orgs, :redeliver_webhook_delivery},
      url: "/orgs/#{org}/hooks/#{hook_id}/deliveries/#{delivery_id}/attempts",
      method: :post,
      response: [
        {202, :map},
        {400, {:union, [{GitHubOpenAPI.BasicError, :t}, {GitHubOpenAPI.ScimError, :t}]}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove a custom property for an organization

  Removes a custom property that is defined for an organization.

  To use this endpoint, the authenticated user must be one of:
    - An administrator for the organization.
    - A user, or a user on a team, with the fine-grained permission of `custom_properties_org_definitions_manager` in the organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/custom-properties#remove-a-custom-property-for-an-organization)

  """
  @spec remove_custom_property(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def remove_custom_property(org, custom_property_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, custom_property_name: custom_property_name],
      call: {GitHubOpenAPI.Orgs, :remove_custom_property},
      url: "/orgs/#{org}/properties/schema/#{custom_property_name}",
      method: :delete,
      response: [
        {204, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove an organization member

  Removing a user from this list will remove them from all teams and they will no longer have any access to the organization's repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#remove-an-organization-member)

  """
  @spec remove_member(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def remove_member(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :remove_member},
      url: "/orgs/#{org}/members/#{username}",
      method: :delete,
      response: [{204, :null}, {403, {GitHubOpenAPI.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Remove organization membership for a user

  In order to remove a user's membership with an organization, the authenticated user must be an organization owner.

  If the specified user is an active member of the organization, this will remove them from the organization. If the specified user has been invited to the organization, this will cancel their invitation. The specified user will receive an email notification in both cases.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#remove-organization-membership-for-a-user)

  """
  @spec remove_membership_for_user(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def remove_membership_for_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :remove_membership_for_user},
      url: "/orgs/#{org}/memberships/#{username}",
      method: :delete,
      response: [
        {204, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type remove_outside_collaborator_422_json_resp :: %{
          __info__: map,
          documentation_url: String.t() | nil,
          message: String.t() | nil
        }

  @doc """
  Remove outside collaborator from an organization

  Removing a user from this list will remove them from all the organization's repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/outside-collaborators#remove-outside-collaborator-from-an-organization)

  """
  @spec remove_outside_collaborator(String.t(), String.t(), keyword) :: :ok | {:error, map}
  def remove_outside_collaborator(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :remove_outside_collaborator},
      url: "/orgs/#{org}/outside_collaborators/#{username}",
      method: :delete,
      response: [
        {204, :null},
        {422, {GitHubOpenAPI.Orgs, :remove_outside_collaborator_422_json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove public organization membership for the authenticated user

  Removes the public membership for the authenticated user from the specified organization, unless public visibility is enforced by default.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#remove-public-organization-membership-for-the-authenticated-user)

  """
  @spec remove_public_membership_for_authenticated_user(String.t(), String.t(), keyword) ::
          :ok | :error
  def remove_public_membership_for_authenticated_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :remove_public_membership_for_authenticated_user},
      url: "/orgs/#{org}/public_members/#{username}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Remove a security manager team

  > [!WARNING]
  > **Closing down notice:** This operation is closing down and will be removed starting January 1, 2026. Please use the "[Organization Roles](https://docs.github.com/rest/orgs/organization-roles)" endpoints instead.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/security-managers#remove-a-security-manager-team)

  """
  @spec remove_security_manager_team(String.t(), String.t(), keyword) :: :ok | :error
  def remove_security_manager_team(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHubOpenAPI.Orgs, :remove_security_manager_team},
      url: "/orgs/#{org}/security-managers/teams/#{team_slug}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Review a request to access organization resources with a fine-grained personal access token

  Approves or denies a pending request to access organization resources via a fine-grained personal access token.

  Only GitHub Apps can use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/personal-access-tokens#review-a-request-to-access-organization-resources-with-a-fine-grained-personal-access-token)

  """
  @spec review_pat_grant_request(String.t(), integer, map, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def review_pat_grant_request(org, pat_request_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, pat_request_id: pat_request_id, body: body],
      call: {GitHubOpenAPI.Orgs, :review_pat_grant_request},
      url: "/orgs/#{org}/personal-access-token-requests/#{pat_request_id}",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Review requests to access organization resources with fine-grained personal access tokens

  Approves or denies multiple pending requests to access organization resources via a fine-grained personal access token.

  Only GitHub Apps can use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/personal-access-tokens#review-requests-to-access-organization-resources-with-fine-grained-personal-access-tokens)

  """
  @spec review_pat_grant_requests_in_bulk(String.t(), map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def review_pat_grant_requests_in_bulk(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Orgs, :review_pat_grant_requests_in_bulk},
      url: "/orgs/#{org}/personal-access-token-requests",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {202, :map},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove all organization roles for a team

  Removes all assigned organization roles from a team. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  The authenticated user must be an administrator for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#remove-all-organization-roles-for-a-team)

  """
  @spec revoke_all_org_roles_team(String.t(), String.t(), keyword) :: :ok | :error
  def revoke_all_org_roles_team(org, team_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug],
      call: {GitHubOpenAPI.Orgs, :revoke_all_org_roles_team},
      url: "/orgs/#{org}/organization-roles/teams/#{team_slug}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Remove all organization roles for a user

  Revokes all assigned organization roles from a user. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  The authenticated user must be an administrator for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#remove-all-organization-roles-for-a-user)

  """
  @spec revoke_all_org_roles_user(String.t(), String.t(), keyword) :: :ok | :error
  def revoke_all_org_roles_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :revoke_all_org_roles_user},
      url: "/orgs/#{org}/organization-roles/users/#{username}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Remove an organization role from a team

  Removes an organization role from a team. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  The authenticated user must be an administrator for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#remove-an-organization-role-from-a-team)

  """
  @spec revoke_org_role_team(String.t(), String.t(), integer, keyword) :: :ok | :error
  def revoke_org_role_team(org, team_slug, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, team_slug: team_slug, role_id: role_id],
      call: {GitHubOpenAPI.Orgs, :revoke_org_role_team},
      url: "/orgs/#{org}/organization-roles/teams/#{team_slug}/#{role_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Remove an organization role from a user

  Remove an organization role from a user. For more information on organization roles, see "[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."

  The authenticated user must be an administrator for the organization to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/organization-roles#remove-an-organization-role-from-a-user)

  """
  @spec revoke_org_role_user(String.t(), String.t(), integer, keyword) :: :ok | :error
  def revoke_org_role_user(org, username, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username, role_id: role_id],
      call: {GitHubOpenAPI.Orgs, :revoke_org_role_user},
      url: "/orgs/#{org}/organization-roles/users/#{username}/#{role_id}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Set organization membership for a user

  Only authenticated organization owners can add a member to the organization or update the member's role.

  *   If the authenticated user is _adding_ a member to the organization, the invited user will receive an email inviting them to the organization. The user's [membership status](https://docs.github.com/rest/orgs/members#get-organization-membership-for-a-user) will be `pending` until they accept the invitation.
      
  *   Authenticated users can _update_ a user's membership by passing the `role` parameter. If the authenticated user changes a member's role to `admin`, the affected user will receive an email notifying them that they've been made an organization owner. If the authenticated user changes an owner's role to `member`, no email will be sent.

  **Rate limits**

  To prevent abuse, organization owners are limited to creating 50 organization invitations for an organization within a 24 hour period. If the organization is more than one month old or on a paid plan, the limit is 500 invitations per 24 hour period.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#set-organization-membership-for-a-user)

  """
  @spec set_membership_for_user(String.t(), String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.OrgMembership.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def set_membership_for_user(org, username, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username, body: body],
      call: {GitHubOpenAPI.Orgs, :set_membership_for_user},
      url: "/orgs/#{org}/memberships/#{username}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.OrgMembership, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Set public organization membership for the authenticated user

  The user can publicize their own membership. (A user cannot publicize the membership for another user.)

  Note that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#set-public-organization-membership-for-the-authenticated-user)

  """
  @spec set_public_membership_for_authenticated_user(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def set_public_membership_for_authenticated_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :set_public_membership_for_authenticated_user},
      url: "/orgs/#{org}/public_members/#{username}",
      method: :put,
      response: [{204, :null}, {403, {GitHubOpenAPI.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Unblock a user from an organization

  Unblocks the given user on behalf of the specified organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/blocking#unblock-a-user-from-an-organization)

  """
  @spec unblock_user(String.t(), String.t(), keyword) :: :ok | :error
  def unblock_user(org, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, username: username],
      call: {GitHubOpenAPI.Orgs, :unblock_user},
      url: "/orgs/#{org}/blocks/#{username}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Update an organization

  > [!WARNING]
  > **Closing down notice:** GitHub will replace and discontinue `members_allowed_repository_creation_type` in favor of more granular permissions. The new input parameters are `members_can_create_public_repositories`, `members_can_create_private_repositories` for all organizations and `members_can_create_internal_repositories` for organizations associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+. For more information, see the [blog post](https://developer.github.com/changes/2019-12-03-internal-visibility-changes).

  > [!WARNING]
  > **Closing down notice:** Code security product enablement for new repositories through the organization API is closing down. Please use [code security configurations](https://docs.github.com/rest/code-security/configurations#set-a-code-security-configuration-as-a-default-for-an-organization) to set defaults instead. For more information on setting a default security configuration, see the [changelog](https://github.blog/changelog/2024-07-09-sunsetting-security-settings-defaults-parameters-in-the-organizations-rest-api/).

  Updates the organization's profile and member privileges.

  The authenticated user must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need the `admin:org` or `repo` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/orgs#update-an-organization)

  """
  @spec update(String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.OrganizationFull.t()}
          | {:error,
             GitHubOpenAPI.BasicError.t()
             | GitHubOpenAPI.ValidationError.t()
             | GitHubOpenAPI.ValidationErrorSimple.t()}
  def update(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Orgs, :update},
      url: "/orgs/#{org}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.OrganizationFull, :t}},
        {409, {GitHubOpenAPI.BasicError, :t}},
        {422,
         {:union,
          [{GitHubOpenAPI.ValidationError, :t}, {GitHubOpenAPI.ValidationErrorSimple, :t}]}}
      ],
      opts: opts
    })
  end

  @doc """
  Update an organization membership for the authenticated user

  Converts the authenticated user to an active member of the organization, if that user has a pending invitation from the organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/members#update-an-organization-membership-for-the-authenticated-user)

  """
  @spec update_membership_for_authenticated_user(String.t(), map, keyword) ::
          {:ok, GitHubOpenAPI.OrgMembership.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def update_membership_for_authenticated_user(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Orgs, :update_membership_for_authenticated_user},
      url: "/user/memberships/orgs/#{org}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.OrgMembership, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update the access a fine-grained personal access token has to organization resources

  Updates the access an organization member has to organization resources via a fine-grained personal access token. Limited to revoking the token's existing access. Limited to revoking a token's existing access.

  Only GitHub Apps can use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/personal-access-tokens#update-the-access-a-fine-grained-personal-access-token-has-to-organization-resources)

  """
  @spec update_pat_access(String.t(), integer, map, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def update_pat_access(org, pat_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, pat_id: pat_id, body: body],
      call: {GitHubOpenAPI.Orgs, :update_pat_access},
      url: "/orgs/#{org}/personal-access-tokens/#{pat_id}",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update the access to organization resources via fine-grained personal access tokens

  Updates the access organization members have to organization resources via fine-grained personal access tokens. Limited to revoking a token's existing access.

  Only GitHub Apps can use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/personal-access-tokens#update-the-access-to-organization-resources-via-fine-grained-personal-access-tokens)

  """
  @spec update_pat_accesses(String.t(), map, keyword) ::
          {:ok, map} | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def update_pat_accesses(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHubOpenAPI.Orgs, :update_pat_accesses},
      url: "/orgs/#{org}/personal-access-tokens",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {202, :map},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}},
        {500, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update an organization webhook

  Updates a webhook configured in an organization. When you update a webhook,
  the `secret` will be overwritten. If you previously had a `secret` set, you must
  provide the same `secret` or set a new `secret` or the secret will be removed. If
  you are only updating individual webhook `config` properties, use "[Update a webhook
  configuration for an organization](/rest/orgs/webhooks#update-a-webhook-configuration-for-an-organization)".

  You must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#update-an-organization-webhook)

  """
  @spec update_webhook(String.t(), integer, map, keyword) ::
          {:ok, GitHubOpenAPI.OrgHook.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def update_webhook(org, hook_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, hook_id: hook_id, body: body],
      call: {GitHubOpenAPI.Orgs, :update_webhook},
      url: "/orgs/#{org}/hooks/#{hook_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.OrgHook, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a webhook configuration for an organization

  Updates the webhook configuration for an organization. To update more information about the webhook, including the `active` state and `events`, use "[Update an organization webhook ](/rest/orgs/webhooks#update-an-organization-webhook)."

  You must be an organization owner to use this endpoint.

  OAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/orgs/webhooks#update-a-webhook-configuration-for-an-organization)

  """
  @spec update_webhook_config_for_org(String.t(), integer, map, keyword) ::
          {:ok, GitHubOpenAPI.WebhookConfig.t()} | :error
  def update_webhook_config_for_org(org, hook_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, hook_id: hook_id, body: body],
      call: {GitHubOpenAPI.Orgs, :update_webhook_config_for_org},
      url: "/orgs/#{org}/hooks/#{hook_id}/config",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GitHubOpenAPI.WebhookConfig, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:convert_member_to_outside_collaborator_202_json_resp) do
    []
  end

  def __fields__(:list_app_installations_200_json_resp) do
    [installations: [{GitHubOpenAPI.Installation, :t}], total_count: :integer]
  end

  def __fields__(:list_attestations_200_json_resp) do
    [attestations: [{GitHubOpenAPI.OrgsAttestations, :list_attestations_200_json_resp}]]
  end

  def __fields__(:list_org_roles_200_json_resp) do
    [roles: [{GitHubOpenAPI.OrganizationRole, :t}], total_count: :integer]
  end

  def __fields__(:remove_outside_collaborator_422_json_resp) do
    [documentation_url: {:string, :generic}, message: {:string, :generic}]
  end
end
