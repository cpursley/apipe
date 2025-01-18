defmodule Apipe.Providers.GitHub.Types do
  @moduledoc """
  Type definitions for GitHub API responses.
  """

  alias Apipe.Providers.GitHub.Types.{User, Repository, Issue, Topic, SearchResponse}

  @doc """
  Casts a GitHub license JSON object into a license map.
  Returns `nil` if the input is `nil`.
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

  @doc """
  Casts a GitHub user JSON object into a User struct.
  Returns `nil` if the input is `nil`.
  """
  def cast_user(nil), do: nil
  def cast_user(user) when is_map(user) do
    case User.cast(user) do
      {:ok, user} -> user
      _ -> nil
    end
  end

  defmodule SearchResponse do
    @moduledoc """
    GitHub search response data structure.
    """

    @type t :: %__MODULE__{
      total_count: integer(),
      incomplete_results: boolean(),
      items: list(any())
    }

    defstruct [
      :total_count,
      :incomplete_results,
      :items
    ]

    @doc """
    Casts a GitHub search response to a SearchResponse struct.
    """
    def cast(data, item_type) when is_map(data) do
      items = Enum.map(data["items"] || [], &cast_item(&1, item_type))
      {:ok, struct(__MODULE__, %{
        total_count: data["total_count"],
        incomplete_results: data["incomplete_results"],
        items: items
      })}
    end

    defp cast_item(item, type) do
      case type.cast(item) do
        {:ok, data} -> data
        _ -> item
      end
    end
  end

  defmodule User do
    @moduledoc """
    GitHub user data structure.
    """

    @type t :: %__MODULE__{
      id: integer(),
      login: String.t(),
      name: String.t() | nil,
      email: String.t() | nil,
      bio: String.t() | nil,
      company: String.t() | nil,
      blog: String.t() | nil,
      location: String.t() | nil,
      public_repos: integer() | nil,
      public_gists: integer() | nil,
      followers: integer() | nil,
      following: integer() | nil,
      created_at: String.t() | nil,
      updated_at: String.t() | nil,
      score: float() | nil,
      # Additional fields from API response
      avatar_url: String.t(),
      events_url: String.t(),
      followers_url: String.t(),
      following_url: String.t(),
      gists_url: String.t(),
      gravatar_id: String.t(),
      html_url: String.t(),
      node_id: String.t(),
      organizations_url: String.t(),
      received_events_url: String.t(),
      repos_url: String.t(),
      site_admin: boolean(),
      starred_url: String.t(),
      subscriptions_url: String.t(),
      type: String.t(),
      url: String.t()
    }

    defstruct [
      :id,
      :login,
      :name,
      :email,
      :bio,
      :company,
      :blog,
      :location,
      :public_repos,
      :public_gists,
      :followers,
      :following,
      :created_at,
      :updated_at,
      :score,
      # Additional fields from API response
      :avatar_url,
      :events_url,
      :followers_url,
      :following_url,
      :gists_url,
      :gravatar_id,
      :html_url,
      :node_id,
      :organizations_url,
      :received_events_url,
      :repos_url,
      :site_admin,
      :starred_url,
      :subscriptions_url,
      :type,
      :url
    ]

    @doc """
    Casts a GitHub user response to a User struct.
    """
    def cast(data) when is_map(data) do
      {:ok, struct(__MODULE__, %{
        id: data["id"],
        login: data["login"],
        name: data["name"],
        email: data["email"],
        bio: data["bio"],
        company: data["company"],
        blog: data["blog"],
        location: data["location"],
        public_repos: data["public_repos"],
        public_gists: data["public_gists"],
        followers: data["followers"],
        following: data["following"],
        created_at: data["created_at"],
        updated_at: data["updated_at"],
        score: data["score"],
        avatar_url: data["avatar_url"],
        events_url: data["events_url"],
        followers_url: data["followers_url"],
        following_url: data["following_url"],
        gists_url: data["gists_url"],
        gravatar_id: data["gravatar_id"],
        html_url: data["html_url"],
        node_id: data["node_id"],
        organizations_url: data["organizations_url"],
        received_events_url: data["received_events_url"],
        repos_url: data["repos_url"],
        site_admin: data["site_admin"],
        starred_url: data["starred_url"],
        subscriptions_url: data["subscriptions_url"],
        type: data["type"],
        url: data["url"]
      })}
    end
  end

  defmodule Repository do
    @moduledoc """
    Type module for GitHub repositories.
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
      topics: list(String.t()),
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
    Casts a GitHub repository response to a Repository struct.
    """
    def cast(data) when is_map(data) do
      # Cast owner data first
      owner = case data["owner"] do
        nil -> nil
        owner_data when is_map(owner_data) ->
          {:ok, user} = Apipe.Providers.GitHub.Types.User.cast(owner_data)
          user
      end

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
        owner: owner
      })}
    end
  end

  defmodule Issue do
    @moduledoc """
    GitHub issue data structure.
    """

    @type t :: %__MODULE__{
      id: integer(),
      number: integer(),
      title: String.t(),
      state: String.t(),
      locked: boolean(),
      assignee: User.t() | nil,
      assignees: list(User.t()),
      milestone: map() | nil,
      comments: integer(),
      created_at: String.t(),
      updated_at: String.t(),
      closed_at: String.t() | nil,
      body: String.t(),
      user: User.t(),
      labels: list(map())
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
    Casts a GitHub issue response to an Issue struct.
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

  defmodule Topic do
    @moduledoc """
    Type module for GitHub topics.
    """

    @type t :: %__MODULE__{
      name: String.t(),
      display_name: String.t(),
      short_description: String.t(),
      description: String.t(),
      created_by: String.t(),
      released: String.t(),
      created_at: String.t(),
      updated_at: String.t(),
      featured: boolean(),
      curated: boolean(),
      score: float()
    }

    defstruct [
      :name,
      :display_name,
      :short_description,
      :description,
      :created_by,
      :released,
      :created_at,
      :updated_at,
      :featured,
      :curated,
      :score
    ]

    @doc """
    Casts a GitHub topic response to a Topic struct.
    """
    def cast(topic) when is_map(topic) do
      {:ok, struct(__MODULE__, %{
        name: topic["name"],
        display_name: topic["display_name"],
        short_description: topic["short_description"],
        description: topic["description"],
        created_by: topic["created_by"],
        released: topic["released"],
        created_at: topic["created_at"],
        updated_at: topic["updated_at"],
        featured: topic["featured"],
        curated: topic["curated"],
        score: topic["score"]
      })}
    end
  end
end
