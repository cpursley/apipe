defmodule GitHubOpenAPI.Users do
  @moduledoc """
  Provides API endpoints related to users
  """

  @default_client GitHubOpenAPI.Client

  @doc """
  Add an email address for the authenticated user

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/emails#add-an-email-address-for-the-authenticated-user)

  """
  @spec add_email_for_authenticated_user(map | String.t() | [String.t()], keyword) ::
          {:ok, [GitHubOpenAPI.Email.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def add_email_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Users, :add_email_for_authenticated_user},
      url: "/user/emails",
      body: body,
      method: :post,
      request: [{"application/json", {:union, [:map, {:string, :generic}, [string: :generic]]}}],
      response: [
        {201, [{GitHubOpenAPI.Email, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Add social accounts for the authenticated user

  Add one or more social accounts to the authenticated user's profile.

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/social-accounts#add-social-accounts-for-the-authenticated-user)

  """
  @spec add_social_account_for_authenticated_user(map, keyword) ::
          {:ok, [GitHubOpenAPI.SocialAccount.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def add_social_account_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Users, :add_social_account_for_authenticated_user},
      url: "/user/social_accounts",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, [{GitHubOpenAPI.SocialAccount, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Block a user

  Blocks the given user and returns a 204. If the authenticated user cannot block the given user a 422 is returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/blocking#block-a-user)

  """
  @spec block(String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def block(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :block},
      url: "/user/blocks/#{username}",
      method: :put,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Check if a user is blocked by the authenticated user

  Returns a 204 if the given user is blocked by the authenticated user. Returns a 404 if the given user is not blocked by the authenticated user, or if the given user account has been identified as spam by GitHub.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/blocking#check-if-a-user-is-blocked-by-the-authenticated-user)

  """
  @spec check_blocked(String.t(), keyword) :: :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def check_blocked(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :check_blocked},
      url: "/user/blocks/#{username}",
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
  Check if a user follows another user

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/followers#check-if-a-user-follows-another-user)

  """
  @spec check_following_for_user(String.t(), String.t(), keyword) :: :ok | :error
  def check_following_for_user(username, target_user, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username, target_user: target_user],
      call: {GitHubOpenAPI.Users, :check_following_for_user},
      url: "/users/#{username}/following/#{target_user}",
      method: :get,
      response: [{204, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Check if a person is followed by the authenticated user

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/followers#check-if-a-person-is-followed-by-the-authenticated-user)

  """
  @spec check_person_is_followed_by_authenticated(String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def check_person_is_followed_by_authenticated(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :check_person_is_followed_by_authenticated},
      url: "/user/following/#{username}",
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
  Create a GPG key for the authenticated user

  Adds a GPG key to the authenticated user's GitHub account.

  OAuth app tokens and personal access tokens (classic) need the `write:gpg_key` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/gpg-keys#create-a-gpg-key-for-the-authenticated-user)

  """
  @spec create_gpg_key_for_authenticated_user(map, keyword) ::
          {:ok, GitHubOpenAPI.GpgKey.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def create_gpg_key_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Users, :create_gpg_key_for_authenticated_user},
      url: "/user/gpg_keys",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHubOpenAPI.GpgKey, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a public SSH key for the authenticated user

  Adds a public SSH key to the authenticated user's GitHub account.

  OAuth app tokens and personal access tokens (classic) need the `write:gpg_key` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/keys#create-a-public-ssh-key-for-the-authenticated-user)

  """
  @spec create_public_ssh_key_for_authenticated_user(map, keyword) ::
          {:ok, GitHubOpenAPI.Key.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def create_public_ssh_key_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Users, :create_public_ssh_key_for_authenticated_user},
      url: "/user/keys",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHubOpenAPI.Key, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a SSH signing key for the authenticated user

  Creates an SSH signing key for the authenticated user's GitHub account.

  OAuth app tokens and personal access tokens (classic) need the `write:ssh_signing_key` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/ssh-signing-keys#create-a-ssh-signing-key-for-the-authenticated-user)

  """
  @spec create_ssh_signing_key_for_authenticated_user(map, keyword) ::
          {:ok, GitHubOpenAPI.SshSigningKey.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def create_ssh_signing_key_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Users, :create_ssh_signing_key_for_authenticated_user},
      url: "/user/ssh_signing_keys",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHubOpenAPI.SshSigningKey, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an email address for the authenticated user

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/emails#delete-an-email-address-for-the-authenticated-user)

  """
  @spec delete_email_for_authenticated_user(map | String.t() | [String.t()], keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def delete_email_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Users, :delete_email_for_authenticated_user},
      url: "/user/emails",
      body: body,
      method: :delete,
      request: [{"application/json", {:union, [:map, {:string, :generic}, [string: :generic]]}}],
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a GPG key for the authenticated user

  Removes a GPG key from the authenticated user's GitHub account.

  OAuth app tokens and personal access tokens (classic) need the `admin:gpg_key` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/gpg-keys#delete-a-gpg-key-for-the-authenticated-user)

  """
  @spec delete_gpg_key_for_authenticated_user(integer, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def delete_gpg_key_for_authenticated_user(gpg_key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gpg_key_id: gpg_key_id],
      call: {GitHubOpenAPI.Users, :delete_gpg_key_for_authenticated_user},
      url: "/user/gpg_keys/#{gpg_key_id}",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a public SSH key for the authenticated user

  Removes a public SSH key from the authenticated user's GitHub account.

  OAuth app tokens and personal access tokens (classic) need the `admin:public_key` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/keys#delete-a-public-ssh-key-for-the-authenticated-user)

  """
  @spec delete_public_ssh_key_for_authenticated_user(integer, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def delete_public_ssh_key_for_authenticated_user(key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [key_id: key_id],
      call: {GitHubOpenAPI.Users, :delete_public_ssh_key_for_authenticated_user},
      url: "/user/keys/#{key_id}",
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

  @doc """
  Delete social accounts for the authenticated user

  Deletes one or more social accounts from the authenticated user's profile.

  OAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/social-accounts#delete-social-accounts-for-the-authenticated-user)

  """
  @spec delete_social_account_for_authenticated_user(map, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def delete_social_account_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Users, :delete_social_account_for_authenticated_user},
      url: "/user/social_accounts",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an SSH signing key for the authenticated user

  Deletes an SSH signing key from the authenticated user's GitHub account.

  OAuth app tokens and personal access tokens (classic) need the `admin:ssh_signing_key` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/ssh-signing-keys#delete-an-ssh-signing-key-for-the-authenticated-user)

  """
  @spec delete_ssh_signing_key_for_authenticated_user(integer, keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def delete_ssh_signing_key_for_authenticated_user(ssh_signing_key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ssh_signing_key_id: ssh_signing_key_id],
      call: {GitHubOpenAPI.Users, :delete_ssh_signing_key_for_authenticated_user},
      url: "/user/ssh_signing_keys/#{ssh_signing_key_id}",
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

  @doc """
  Follow a user

  Note that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP verbs](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

  OAuth app tokens and personal access tokens (classic) need the `user:follow` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/followers#follow-a-user)

  """
  @spec follow(String.t(), keyword) ::
          :ok | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def follow(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :follow},
      url: "/user/following/#{username}",
      method: :put,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get the authenticated user

  OAuth app tokens and personal access tokens (classic) need the `user` scope in order for the response to include private profile information.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/users#get-the-authenticated-user)

  """
  @spec get_authenticated(keyword) ::
          {:ok, GitHubOpenAPI.PrivateUser.t() | GitHubOpenAPI.PublicUser.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_authenticated(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :get_authenticated},
      url: "/user",
      method: :get,
      response: [
        {200, {:union, [{GitHubOpenAPI.PrivateUser, :t}, {GitHubOpenAPI.PublicUser, :t}]}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a user using their ID

  Provides publicly available information about someone with a GitHub account. This method takes their durable user `ID` instead of their `login`, which can change over time.

  If you are requesting information about an [Enterprise Managed User](https://docs.github.com/enterprise-cloud@latest/admin/managing-iam/understanding-iam-for-enterprises/about-enterprise-managed-users), or a GitHub App bot that is installed in an organization that uses Enterprise Managed Users, your requests must be authenticated as a user or GitHub App that has access to the organization to view that account's information. If you are not authorized, the request will return a `404 Not Found` status.

  The `email` key in the following response is the publicly visible email address from your GitHub [profile page](https://github.com/settings/profile). When setting up your profile, you can select a primary email address to be public which provides an email entry for this endpoint. If you do not set a public email address for `email`, then it will have a value of `null`. You only see publicly visible email addresses when authenticated with GitHub. For more information, see [Authentication](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#authentication).

  The Emails API enables you to list all of your email addresses, and toggle a primary email to be visible publicly. For more information, see [Emails API](https://docs.github.com/rest/users/emails).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/users#get-a-user-using-their-id)

  """
  @spec get_by_id(integer, keyword) ::
          {:ok, GitHubOpenAPI.PrivateUser.t() | GitHubOpenAPI.PublicUser.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_by_id(account_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [account_id: account_id],
      call: {GitHubOpenAPI.Users, :get_by_id},
      url: "/user/#{account_id}",
      method: :get,
      response: [
        {200, {:union, [{GitHubOpenAPI.PrivateUser, :t}, {GitHubOpenAPI.PublicUser, :t}]}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a user

  Provides publicly available information about someone with a GitHub account.

  If you are requesting information about an [Enterprise Managed User](https://docs.github.com/enterprise-cloud@latest/admin/managing-iam/understanding-iam-for-enterprises/about-enterprise-managed-users), or a GitHub App bot that is installed in an organization that uses Enterprise Managed Users, your requests must be authenticated as a user or GitHub App that has access to the organization to view that account's information. If you are not authorized, the request will return a `404 Not Found` status.

  The `email` key in the following response is the publicly visible email address from your GitHub [profile page](https://github.com/settings/profile). When setting up your profile, you can select a primary email address to be public which provides an email entry for this endpoint. If you do not set a public email address for `email`, then it will have a value of `null`. You only see publicly visible email addresses when authenticated with GitHub. For more information, see [Authentication](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#authentication).

  The Emails API enables you to list all of your email addresses, and toggle a primary email to be visible publicly. For more information, see [Emails API](https://docs.github.com/rest/users/emails).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/users#get-a-user)

  """
  @spec get_by_username(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.PrivateUser.t() | GitHubOpenAPI.PublicUser.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def get_by_username(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :get_by_username},
      url: "/users/#{username}",
      method: :get,
      response: [
        {200, {:union, [{GitHubOpenAPI.PrivateUser, :t}, {GitHubOpenAPI.PublicUser, :t}]}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get contextual information for a user

  Provides hovercard information. You can find out more about someone in relation to their pull requests, issues, repositories, and organizations.

    The `subject_type` and `subject_id` parameters provide context for the person's hovercard, which returns more information than without the parameters. For example, if you wanted to find out more about `octocat` who owns the `Spoon-Knife` repository, you would use a `subject_type` value of `repository` and a `subject_id` value of `1300192` (the ID of the `Spoon-Knife` repository).

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

  ## Options

    * `subject_type`: Identifies which additional information you'd like to receive about the person's hovercard. Can be `organization`, `repository`, `issue`, `pull_request`. **Required** when using `subject_id`.
    * `subject_id`: Uses the ID for the `subject_type` you specified. **Required** when using `subject_type`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/users#get-contextual-information-for-a-user)

  """
  @spec get_context_for_user(String.t(), keyword) ::
          {:ok, GitHubOpenAPI.Hovercard.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def get_context_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:subject_id, :subject_type])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :get_context_for_user},
      url: "/users/#{username}/hovercard",
      method: :get,
      query: query,
      response: [
        {200, {GitHubOpenAPI.Hovercard, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a GPG key for the authenticated user

  View extended details for a single GPG key.

  OAuth app tokens and personal access tokens (classic) need the `read:gpg_key` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/gpg-keys#get-a-gpg-key-for-the-authenticated-user)

  """
  @spec get_gpg_key_for_authenticated_user(integer, keyword) ::
          {:ok, GitHubOpenAPI.GpgKey.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_gpg_key_for_authenticated_user(gpg_key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [gpg_key_id: gpg_key_id],
      call: {GitHubOpenAPI.Users, :get_gpg_key_for_authenticated_user},
      url: "/user/gpg_keys/#{gpg_key_id}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.GpgKey, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a public SSH key for the authenticated user

  View extended details for a single public SSH key.

  OAuth app tokens and personal access tokens (classic) need the `read:public_key` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/keys#get-a-public-ssh-key-for-the-authenticated-user)

  """
  @spec get_public_ssh_key_for_authenticated_user(integer, keyword) ::
          {:ok, GitHubOpenAPI.Key.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_public_ssh_key_for_authenticated_user(key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [key_id: key_id],
      call: {GitHubOpenAPI.Users, :get_public_ssh_key_for_authenticated_user},
      url: "/user/keys/#{key_id}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.Key, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get an SSH signing key for the authenticated user

  Gets extended details for an SSH signing key.

  OAuth app tokens and personal access tokens (classic) need the `read:ssh_signing_key` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/ssh-signing-keys#get-an-ssh-signing-key-for-the-authenticated-user)

  """
  @spec get_ssh_signing_key_for_authenticated_user(integer, keyword) ::
          {:ok, GitHubOpenAPI.SshSigningKey.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def get_ssh_signing_key_for_authenticated_user(ssh_signing_key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ssh_signing_key_id: ssh_signing_key_id],
      call: {GitHubOpenAPI.Users, :get_ssh_signing_key_for_authenticated_user},
      url: "/user/ssh_signing_keys/#{ssh_signing_key_id}",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.SshSigningKey, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List users

  Lists all users, in the order that they signed up on GitHub. This list includes personal user accounts and organization accounts.

  Note: Pagination is powered exclusively by the `since` parameter. Use the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers) to get the URL for the next page of users.

  ## Options

    * `since`: A user ID. Only return users with an ID greater than this ID.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/users#list-users)

  """
  @spec list(keyword) :: {:ok, [GitHubOpenAPI.SimpleUser.t()]} | :error
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:per_page, :since])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list},
      url: "/users",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.SimpleUser, :t}]}, {304, :null}],
      opts: opts
    })
  end

  @type list_attestations_200_json_resp :: %{
          __info__: map,
          attestations: [GitHubOpenAPI.UsersAttestations.list_attestations_200_json_resp()] | nil
        }

  @doc """
  List attestations

  List a collection of artifact attestations with a given subject digest that are associated with repositories owned by a user.

  The collection of attestations returned by this endpoint is filtered according to the authenticated user's permissions; if the authenticated user cannot read a repository, the attestations associated with that repository will not be included in the response. In addition, when using a fine-grained access token the `attestations:read` permission is required.

  **Please note:** in order to offer meaningful security benefits, an attestation's signature and timestamps **must** be cryptographically verified, and the identity of the attestation signer **must** be validated. Attestations can be verified using the [GitHub CLI `attestation verify` command](https://cli.github.com/manual/gh_attestation_verify). For more information, see [our guide on how to use artifact attestations to establish a build's provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds).

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `before`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results before this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `after`: A cursor, as given in the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers). If specified, the query only searches for results after this cursor. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/attestations#list-attestations)

  """
  @spec list_attestations(String.t(), String.t(), keyword) ::
          {:ok, map | GitHubOpenAPI.EmptyObject.t()} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_attestations(username, subject_digest, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :per_page])

    client.request(%{
      args: [username: username, subject_digest: subject_digest],
      call: {GitHubOpenAPI.Users, :list_attestations},
      url: "/users/#{username}/attestations/#{subject_digest}",
      method: :get,
      query: query,
      response: [
        {200, {GitHubOpenAPI.Users, :list_attestations_200_json_resp}},
        {201, {GitHubOpenAPI.EmptyObject, :t}},
        {204, :null},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List users blocked by the authenticated user

  List the users you've blocked on your personal account.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/blocking#list-users-blocked-by-the-authenticated-user)

  """
  @spec list_blocked_by_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.SimpleUser.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_blocked_by_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list_blocked_by_authenticated_user},
      url: "/user/blocks",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.SimpleUser, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List email addresses for the authenticated user

  Lists all of your email addresses, and specifies which one is visible
  to the public.

  OAuth app tokens and personal access tokens (classic) need the `user:email` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/emails#list-email-addresses-for-the-authenticated-user)

  """
  @spec list_emails_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.Email.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_emails_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list_emails_for_authenticated_user},
      url: "/user/emails",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.Email, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List the people the authenticated user follows

  Lists the people who the authenticated user follows.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/followers#list-the-people-the-authenticated-user-follows)

  """
  @spec list_followed_by_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.SimpleUser.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_followed_by_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list_followed_by_authenticated_user},
      url: "/user/following",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.SimpleUser, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List followers of the authenticated user

  Lists the people following the authenticated user.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/followers#list-followers-of-the-authenticated-user)

  """
  @spec list_followers_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.SimpleUser.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_followers_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list_followers_for_authenticated_user},
      url: "/user/followers",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.SimpleUser, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List followers of a user

  Lists the people following the specified user.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/followers#list-followers-of-a-user)

  """
  @spec list_followers_for_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.SimpleUser.t()]} | :error
  def list_followers_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :list_followers_for_user},
      url: "/users/#{username}/followers",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.SimpleUser, :t}]}],
      opts: opts
    })
  end

  @doc """
  List the people a user follows

  Lists the people who the specified user follows.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/followers#list-the-people-a-user-follows)

  """
  @spec list_following_for_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.SimpleUser.t()]} | :error
  def list_following_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :list_following_for_user},
      url: "/users/#{username}/following",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.SimpleUser, :t}]}],
      opts: opts
    })
  end

  @doc """
  List GPG keys for the authenticated user

  Lists the current user's GPG keys.

  OAuth app tokens and personal access tokens (classic) need the `read:gpg_key` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/gpg-keys#list-gpg-keys-for-the-authenticated-user)

  """
  @spec list_gpg_keys_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.GpgKey.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_gpg_keys_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list_gpg_keys_for_authenticated_user},
      url: "/user/gpg_keys",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.GpgKey, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List GPG keys for a user

  Lists the GPG keys for a user. This information is accessible by anyone.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/gpg-keys#list-gpg-keys-for-a-user)

  """
  @spec list_gpg_keys_for_user(String.t(), keyword) :: {:ok, [GitHubOpenAPI.GpgKey.t()]} | :error
  def list_gpg_keys_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :list_gpg_keys_for_user},
      url: "/users/#{username}/gpg_keys",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.GpgKey, :t}]}],
      opts: opts
    })
  end

  @doc """
  List public email addresses for the authenticated user

  Lists your publicly visible email address, which you can set with the
  [Set primary email visibility for the authenticated user](https://docs.github.com/rest/users/emails#set-primary-email-visibility-for-the-authenticated-user)
  endpoint.

  OAuth app tokens and personal access tokens (classic) need the `user:email` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/emails#list-public-email-addresses-for-the-authenticated-user)

  """
  @spec list_public_emails_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.Email.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_public_emails_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list_public_emails_for_authenticated_user},
      url: "/user/public_emails",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.Email, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List public keys for a user

  Lists the _verified_ public SSH keys for a user. This is accessible by anyone.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/keys#list-public-keys-for-a-user)

  """
  @spec list_public_keys_for_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.KeySimple.t()]} | :error
  def list_public_keys_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :list_public_keys_for_user},
      url: "/users/#{username}/keys",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.KeySimple, :t}]}],
      opts: opts
    })
  end

  @doc """
  List public SSH keys for the authenticated user

  Lists the public SSH keys for the authenticated user's GitHub account.

  OAuth app tokens and personal access tokens (classic) need the `read:public_key` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/keys#list-public-ssh-keys-for-the-authenticated-user)

  """
  @spec list_public_ssh_keys_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.Key.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_public_ssh_keys_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list_public_ssh_keys_for_authenticated_user},
      url: "/user/keys",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.Key, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List social accounts for the authenticated user

  Lists all of your social accounts.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/social-accounts#list-social-accounts-for-the-authenticated-user)

  """
  @spec list_social_accounts_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.SocialAccount.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_social_accounts_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list_social_accounts_for_authenticated_user},
      url: "/user/social_accounts",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.SocialAccount, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List social accounts for a user

  Lists social media accounts for a user. This endpoint is accessible by anyone.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/social-accounts#list-social-accounts-for-a-user)

  """
  @spec list_social_accounts_for_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.SocialAccount.t()]} | :error
  def list_social_accounts_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :list_social_accounts_for_user},
      url: "/users/#{username}/social_accounts",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.SocialAccount, :t}]}],
      opts: opts
    })
  end

  @doc """
  List SSH signing keys for the authenticated user

  Lists the SSH signing keys for the authenticated user's GitHub account.

  OAuth app tokens and personal access tokens (classic) need the `read:ssh_signing_key` scope to use this endpoint.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/ssh-signing-keys#list-ssh-signing-keys-for-the-authenticated-user)

  """
  @spec list_ssh_signing_keys_for_authenticated_user(keyword) ::
          {:ok, [GitHubOpenAPI.SshSigningKey.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def list_ssh_signing_keys_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHubOpenAPI.Users, :list_ssh_signing_keys_for_authenticated_user},
      url: "/user/ssh_signing_keys",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.SshSigningKey, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List SSH signing keys for a user

  Lists the SSH signing keys for a user. This operation is accessible by anyone.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/ssh-signing-keys#list-ssh-signing-keys-for-a-user)

  """
  @spec list_ssh_signing_keys_for_user(String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.SshSigningKey.t()]} | :error
  def list_ssh_signing_keys_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :list_ssh_signing_keys_for_user},
      url: "/users/#{username}/ssh_signing_keys",
      method: :get,
      query: query,
      response: [{200, [{GitHubOpenAPI.SshSigningKey, :t}]}],
      opts: opts
    })
  end

  @doc """
  Set primary email visibility for the authenticated user

  Sets the visibility for your primary email addresses.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/emails#set-primary-email-visibility-for-the-authenticated-user)

  """
  @spec set_primary_email_visibility_for_authenticated_user(map, keyword) ::
          {:ok, [GitHubOpenAPI.Email.t()]}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def set_primary_email_visibility_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Users, :set_primary_email_visibility_for_authenticated_user},
      url: "/user/email/visibility",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, [{GitHubOpenAPI.Email, :t}]},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Unblock a user

  Unblocks the given user and returns a 204.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/blocking#unblock-a-user)

  """
  @spec unblock(String.t(), keyword) :: :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def unblock(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :unblock},
      url: "/user/blocks/#{username}",
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

  @doc """
  Unfollow a user

  OAuth app tokens and personal access tokens (classic) need the `user:follow` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/followers#unfollow-a-user)

  """
  @spec unfollow(String.t(), keyword) :: :ok | {:error, GitHubOpenAPI.BasicError.t()}
  def unfollow(username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [username: username],
      call: {GitHubOpenAPI.Users, :unfollow},
      url: "/user/following/#{username}",
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

  @doc """
  Update the authenticated user

  **Note:** If your email is set to private and you send an `email` parameter as part of this request to update your profile, your privacy settings are still enforced: the email address will not be displayed on your public profile or via the API.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/users/users#update-the-authenticated-user)

  """
  @spec update_authenticated(map, keyword) ::
          {:ok, GitHubOpenAPI.PrivateUser.t()}
          | {:error, GitHubOpenAPI.BasicError.t() | GitHubOpenAPI.ValidationError.t()}
  def update_authenticated(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHubOpenAPI.Users, :update_authenticated},
      url: "/user",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHubOpenAPI.PrivateUser, :t}},
        {304, :null},
        {401, {GitHubOpenAPI.BasicError, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}},
        {422, {GitHubOpenAPI.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_attestations_200_json_resp) do
    [attestations: [{GitHubOpenAPI.UsersAttestations, :list_attestations_200_json_resp}]]
  end
end
