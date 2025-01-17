defmodule Apipe.Providers.GitHub.Types do
  @moduledoc """
  Common GitHub data structures and their casting functions.

  This module provides structured types for GitHub API responses and functions
  to cast raw JSON data into these types.
  """

  alias __MODULE__.{User, Repository, Issue, SearchResponse, Response}

  defmodule Response do
    @moduledoc """
    Generic GitHub API response wrapper.

    This struct wraps any GitHub API response, providing a consistent structure
    for metadata and pagination information.
    """
    @type t :: %__MODULE__{
      data: any(),
      rate_limit: %{
        limit: integer(),
        remaining: integer(),
        reset: integer(),
        used: integer()
      } | nil,
      etag: String.t() | nil
    }

    defstruct [:data, :rate_limit, :etag]

    def cast(data, rate_limit \\ nil, etag \\ nil) do
      {:ok, struct!(__MODULE__, %{
        data: data,
        rate_limit: rate_limit,
        etag: etag
      })}
    end
  end

  defmodule SearchResponse do
    @moduledoc """
    GitHub search API response wrapper.

    This struct wraps search results, providing metadata about the search operation
    along with the matched items.
    """
    @type t :: %__MODULE__{
      items: list(any()),
      total_count: integer(),
      incomplete_results: boolean()
    }

    defstruct [:items, :total_count, :incomplete_results]

    def cast(data, item_type) when is_map(data) do
      items = Enum.map(data["items"] || [], fn item ->
        {:ok, casted} = item_type.cast(item)
        casted
      end)

      {:ok, struct!(__MODULE__, %{
        items: items,
        total_count: data["total_count"],
        incomplete_results: data["incomplete_results"]
      })}
    end
  end

  @doc """
  Casts a GitHub user JSON object into a User struct.

  Returns `nil` if the input is `nil` or if casting fails.

  ## Examples

      iex> user_data = %{"id" => 1, "login" => "octocat"}
      iex> Apipe.Providers.GitHub.Types.cast_user(user_data)
      %Apipe.Providers.GitHub.Types.User{id: 1, login: "octocat"}

      iex> Apipe.Providers.GitHub.Types.cast_user(nil)
      nil
  """
  def cast_user(nil), do: nil
  def cast_user(user) when is_map(user) do
    case User.cast(user) do
      {:ok, user} -> user
      _ -> nil
    end
  end

  @doc """
  Casts a GitHub license JSON object into a license map.

  Returns `nil` if the input is `nil`.

  ## Examples

      iex> license_data = %{"key" => "mit", "name" => "MIT License"}
      iex> Apipe.Providers.GitHub.Types.cast_license(license_data)
      %{key: "mit", name: "MIT License", spdx_id: nil, url: nil}

      iex> Apipe.Providers.GitHub.Types.cast_license(nil)
      nil
  """
  def cast_license(nil), do: nil
  def cast_license(license) when is_map(license) do
    %{
      key: license["key"],
      name: license["name"],
      spdx_id: license["spdx_id"],
      url: license["url"]
    }
  end

  defmodule Repository do
    @moduledoc """
    GitHub repository data structure.

    Represents a GitHub repository with all its attributes.
    """
    @type t :: %__MODULE__{
      id: integer(),
      name: String.t(),
      full_name: String.t(),
      description: String.t() | nil,
      private: boolean(),
      fork: boolean(),
      created_at: String.t(),
      updated_at: String.t(),
      pushed_at: String.t(),
      size: integer(),
      stargazers_count: integer(),
      watchers_count: integer(),
      language: String.t() | nil,
      forks_count: integer(),
      archived: boolean(),
      disabled: boolean(),
      open_issues_count: integer(),
      license: map() | nil,
      topics: [String.t()],
      visibility: String.t(),
      default_branch: String.t(),
      owner: User.t() | nil
    }

    defstruct [
      :id,
      :name,
      :full_name,
      :description,
      :private,
      :fork,
      :created_at,
      :updated_at,
      :pushed_at,
      :size,
      :stargazers_count,
      :watchers_count,
      :language,
      :forks_count,
      :archived,
      :disabled,
      :open_issues_count,
      :license,
      :topics,
      :visibility,
      :default_branch,
      :owner
    ]

    @doc """
    Casts a raw GitHub repository JSON object into a Repository struct.

    ## Examples

        iex> repo_data = %{
        ...>   "id" => 1234,
        ...>   "name" => "elixir",
        ...>   "owner" => %{"id" => 1, "login" => "elixir-lang"}
        ...> }
        iex> Repository.cast(repo_data)
        {:ok, %Repository{id: 1234, name: "elixir", owner: %User{id: 1, login: "elixir-lang"}}}
    """
    def cast(data) when is_map(data) do
      {:ok, struct(__MODULE__, %{
        id: data["id"],
        name: data["name"],
        full_name: data["full_name"],
        description: data["description"],
        private: data["private"],
        fork: data["fork"],
        created_at: data["created_at"],
        updated_at: data["updated_at"],
        pushed_at: data["pushed_at"],
        size: data["size"],
        stargazers_count: data["stargazers_count"],
        watchers_count: data["watchers_count"],
        language: data["language"],
        forks_count: data["forks_count"],
        archived: data["archived"],
        disabled: data["disabled"],
        open_issues_count: data["open_issues_count"],
        license: Apipe.Providers.GitHub.Types.cast_license(data["license"]),
        topics: data["topics"] || [],
        visibility: data["visibility"],
        default_branch: data["default_branch"],
        owner: Apipe.Providers.GitHub.Types.cast_user(data["owner"])
      })}
    end
  end

  defmodule User do
    @moduledoc """
    GitHub user/organization data structure.

    Represents either a GitHub user or organization account.
    """
    @type t :: %__MODULE__{
      id: integer(),
      login: String.t(),
      avatar_url: String.t(),
      type: String.t(),
      site_admin: boolean(),
      name: String.t() | nil,
      company: String.t() | nil,
      blog: String.t() | nil,
      location: String.t() | nil,
      email: String.t() | nil,
      bio: String.t() | nil,
      twitter_username: String.t() | nil,
      public_repos: integer(),
      public_gists: integer(),
      followers: integer(),
      following: integer(),
      created_at: String.t(),
      updated_at: String.t()
    }

    defstruct [
      :id,
      :login,
      :avatar_url,
      :type,
      :site_admin,
      :name,
      :company,
      :blog,
      :location,
      :email,
      :bio,
      :twitter_username,
      :public_repos,
      :public_gists,
      :followers,
      :following,
      :created_at,
      :updated_at
    ]

    @doc """
    Casts a raw GitHub user JSON object into a User struct.

    ## Examples

        iex> user_data = %{"id" => 1, "login" => "octocat", "type" => "User"}
        iex> User.cast(user_data)
        {:ok, %User{id: 1, login: "octocat", type: "User"}}
    """
    def cast(data) when is_map(data) do
      {:ok, struct(__MODULE__, %{
        id: data["id"],
        login: data["login"],
        avatar_url: data["avatar_url"],
        type: data["type"],
        site_admin: data["site_admin"],
        name: data["name"],
        company: data["company"],
        blog: data["blog"],
        location: data["location"],
        email: data["email"],
        bio: data["bio"],
        twitter_username: data["twitter_username"],
        public_repos: data["public_repos"],
        public_gists: data["public_gists"],
        followers: data["followers"],
        following: data["following"],
        created_at: data["created_at"],
        updated_at: data["updated_at"]
      })}
    end
  end

  defmodule Issue do
    @moduledoc """
    GitHub issue data structure.

    Represents a GitHub issue or pull request.
    """
    @type t :: %__MODULE__{
      id: integer(),
      number: integer(),
      title: String.t(),
      state: String.t(),
      locked: boolean(),
      assignee: User.t() | nil,
      assignees: [User.t()],
      milestone: map() | nil,
      comments: integer(),
      created_at: String.t(),
      updated_at: String.t(),
      closed_at: String.t() | nil,
      body: String.t(),
      user: User.t() | nil,
      labels: [map()]
    }

    defstruct [
      :id,
      :number,
      :title,
      :state,
      :locked,
      :assignee,
      :assignees,
      :milestone,
      :comments,
      :created_at,
      :updated_at,
      :closed_at,
      :body,
      :user,
      :labels
    ]

    @doc """
    Casts a raw GitHub issue JSON object into an Issue struct.

    ## Examples

        iex> issue_data = %{
        ...>   "id" => 1,
        ...>   "number" => 123,
        ...>   "title" => "Bug fix",
        ...>   "user" => %{"id" => 1, "login" => "octocat"}
        ...> }
        iex> Issue.cast(issue_data)
        {:ok, %Issue{id: 1, number: 123, title: "Bug fix", user: %User{id: 1, login: "octocat"}}}
    """
    def cast(data) when is_map(data) do
      {:ok, struct(__MODULE__, %{
        id: data["id"],
        number: data["number"],
        title: data["title"],
        state: data["state"],
        locked: data["locked"],
        assignee: Apipe.Providers.GitHub.Types.cast_user(data["assignee"]),
        assignees: Enum.map(data["assignees"] || [], &Apipe.Providers.GitHub.Types.cast_user/1),
        milestone: data["milestone"],
        comments: data["comments"],
        created_at: data["created_at"],
        updated_at: data["updated_at"],
        closed_at: data["closed_at"],
        body: data["body"],
        user: Apipe.Providers.GitHub.Types.cast_user(data["user"]),
        labels: data["labels"] || []
      })}
    end
  end
end
