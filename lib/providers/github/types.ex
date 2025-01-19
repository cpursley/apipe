defmodule Apipe.Providers.GitHub.Types do
  @moduledoc """
  Type definitions for GitHub API responses.
  """

  alias Apipe.Providers.GitHub.Types.{
    User,
    Repository,
    Issue,
    Topic,
    SearchResponse,
    PullRequest,
    License,
    Release,
    Branch,
    Tag,
    Commit,
    Label
  }

  @doc """
  Casts a GitHub license JSON object into a license map.
  Returns `nil` if the input is `nil`.
  """
  def cast_license(nil), do: nil

  def cast_license(license) when is_map(license) do
    {:ok, data} = License.cast(license)
    data
  end

  defmodule License do
    @moduledoc """
    GitHub license data structure.
    """

    @type t :: %__MODULE__{
            key: String.t(),
            name: String.t(),
            spdx_id: String.t(),
            url: String.t()
          }

    defstruct [
      :key,
      :name,
      :spdx_id,
      :url
    ]

    @doc """
    Casts a GitHub license response to a License struct.
    """
    def cast(data) when is_map(data) do
      {:ok,
       struct(__MODULE__, %{
         key: data["key"],
         name: data["name"],
         spdx_id: data["spdx_id"],
         url: data["url"]
       })}
    end
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

      {:ok,
       struct(__MODULE__, %{
         total_count: data["total_count"],
         incomplete_results: data["incomplete_results"],
         items: items
       })}
    end

    defp cast_item(item, type) do
      # Handle joined data by merging it back into the item before casting
      item_with_joins =
        case item do
          %{pulls: pulls} when not is_nil(pulls) ->
            Map.put(item, "pulls", pulls)

          %{"pulls" => pulls} when not is_nil(pulls) ->
            item

          _ ->
            item
        end

      case type.cast(item_with_joins) do
        {:ok, data} -> data
        _ -> item_with_joins
      end
    end
  end

  defmodule User do
    @moduledoc """
    GitHub User type.
    """

    @behaviour Access

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

    @impl Access
    def fetch(struct, key) do
      Map.fetch(Map.from_struct(struct), key)
    end

    @impl Access
    def get_and_update(struct, key, fun) do
      {get, update} = fun.(Map.get(struct, key))
      {get, Map.put(struct, key, update)}
    end

    @impl Access
    def pop(struct, key) do
      value = Map.get(struct, key)
      {value, Map.put(struct, key, nil)}
    end

    @doc """
    Casts a map to a User struct.
    """
    def cast(data) when is_map(data) do
      user = %__MODULE__{
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
      }

      {:ok, user}
    end
  end

  defmodule PullRequest do
    @moduledoc """
    GitHub pull request data structure.
    """

    @type t :: %__MODULE__{
            id: integer(),
            number: integer(),
            title: String.t(),
            body: String.t() | nil,
            state: String.t(),
            locked: boolean(),
            active_lock_reason: String.t() | nil,
            created_at: String.t(),
            updated_at: String.t(),
            closed_at: String.t() | nil,
            merged_at: String.t() | nil,
            merge_commit_sha: String.t() | nil,
            draft: boolean(),
            user: User.t() | nil,
            assignee: User.t() | nil,
            assignees: list(User.t()),
            requested_reviewers: list(User.t()),
            requested_teams: list(map()),
            labels: list(Label.t()),
            milestone: map() | nil,
            author_association: String.t(),
            auto_merge: map() | nil,
            head: map(),
            base: map(),
            _links: map()
          }

    defstruct [
      :id,
      :number,
      :title,
      :body,
      :state,
      :locked,
      :active_lock_reason,
      :created_at,
      :updated_at,
      :closed_at,
      :merged_at,
      :merge_commit_sha,
      :draft,
      :user,
      :assignee,
      :assignees,
      :requested_reviewers,
      :requested_teams,
      :labels,
      :milestone,
      :author_association,
      :auto_merge,
      :head,
      :base,
      :_links
    ]

    @doc """
    Casts a GitHub pull request response to a PullRequest struct.
    """
    def cast(data) when is_map(data) do
      {:ok,
       struct(__MODULE__, %{
         id: data["id"],
         number: data["number"],
         title: data["title"],
         body: data["body"],
         state: data["state"],
         locked: data["locked"],
         active_lock_reason: data["active_lock_reason"],
         created_at: data["created_at"],
         updated_at: data["updated_at"],
         closed_at: data["closed_at"],
         merged_at: data["merged_at"],
         merge_commit_sha: data["merge_commit_sha"],
         draft: data["draft"],
         user: Apipe.Providers.GitHub.Types.cast_user(data["user"]),
         assignee: Apipe.Providers.GitHub.Types.cast_user(data["assignee"]),
         assignees: Enum.map(data["assignees"] || [], &Apipe.Providers.GitHub.Types.cast_user/1),
         requested_reviewers:
           Enum.map(data["requested_reviewers"] || [], &Apipe.Providers.GitHub.Types.cast_user/1),
         requested_teams: data["requested_teams"] || [],
         labels:
           Enum.map(data["labels"] || [], fn label ->
             {:ok, label_data} = Label.cast(label)
             label_data
           end),
         milestone: data["milestone"],
         author_association: data["author_association"],
         auto_merge: data["auto_merge"],
         head: data["head"],
         base: data["base"],
         _links: data["_links"]
       })}
    end
  end

  defmodule Issue do
    @moduledoc """
    GitHub issue data structure.
    """

    @behaviour Access

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
            labels: list(Label.t())
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

    @impl Access
    def fetch(struct, key) do
      Map.fetch(Map.from_struct(struct), key)
    end

    @impl Access
    def get_and_update(struct, key, fun) do
      {get, update} = fun.(Map.get(struct, key))
      {get, Map.put(struct, key, update)}
    end

    @impl Access
    def pop(struct, key) do
      value = Map.get(struct, key)
      {value, Map.put(struct, key, nil)}
    end

    @doc """
    Casts a GitHub issue response to an Issue struct.
    """
    def cast(data) when is_map(data) do
      {:ok,
       struct(__MODULE__, %{
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
         labels:
           Enum.map(data["labels"] || [], fn label ->
             {:ok, label_data} = Label.cast(label)
             label_data
           end)
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
            license: License.t() | nil,
            topics: list(String.t()),
            visibility: String.t(),
            default_branch: String.t(),
            owner: User.t() | nil,
            pulls: list(PullRequest.t()) | nil,
            issues: list(Issue.t()) | nil,
            releases: list(Release.t()) | nil,
            contributors: list(User.t()) | nil,
            commits: list(Commit.t()) | nil,
            branches: list(Branch.t()) | nil,
            tags: list(Tag.t()) | nil
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
      :owner,
      :pulls,
      :issues,
      :releases,
      :contributors,
      :commits,
      :branches,
      :tags
    ]

    @doc """
    Casts a GitHub repository response to a Repository struct.
    """
    def cast(data) when is_map(data) do
      # Cast owner data first
      owner =
        case data["owner"] do
          nil ->
            nil

          owner_data when is_map(owner_data) ->
            {:ok, user} = Apipe.Providers.GitHub.Types.User.cast(owner_data)
            user
        end

      # Cast pulls data if present
      pulls =
        case data do
          %{pulls: pulls_list} when is_list(pulls_list) ->
            Enum.map(pulls_list, fn pull ->
              {:ok, pr} = PullRequest.cast(pull)
              pr
            end)

          %{"pulls" => pulls_list} when is_list(pulls_list) ->
            Enum.map(pulls_list, fn pull ->
              {:ok, pr} = PullRequest.cast(pull)
              pr
            end)

          _ ->
            nil
        end

      # Cast issues data if present
      issues =
        case data do
          %{issues: issues_list} when is_list(issues_list) ->
            Enum.map(issues_list, fn issue ->
              case issue do
                %Apipe.Providers.GitHub.Types.Issue{} ->
                  issue

                _ ->
                  {:ok, issue_data} = Issue.cast(issue)
                  issue_data
              end
            end)

          %{"issues" => issues_list} when is_list(issues_list) ->
            Enum.map(issues_list, fn issue ->
              case issue do
                %Apipe.Providers.GitHub.Types.Issue{} ->
                  issue

                _ ->
                  {:ok, issue_data} = Issue.cast(issue)
                  issue_data
              end
            end)

          _ ->
            nil
        end

      # Cast releases data if present
      releases =
        case data do
          %{releases: releases_list} when is_list(releases_list) ->
            Enum.map(releases_list, fn release ->
              {:ok, release_data} = Release.cast(release)
              release_data
            end)

          %{"releases" => releases_list} when is_list(releases_list) ->
            Enum.map(releases_list, fn release ->
              {:ok, release_data} = Release.cast(release)
              release_data
            end)

          _ ->
            nil
        end

      # Cast contributors data if present
      contributors =
        case data do
          %{contributors: contributors_list} when is_list(contributors_list) ->
            Enum.map(contributors_list, &Apipe.Providers.GitHub.Types.cast_user/1)

          %{"contributors" => contributors_list} when is_list(contributors_list) ->
            Enum.map(contributors_list, &Apipe.Providers.GitHub.Types.cast_user/1)

          _ ->
            nil
        end

      # Cast commits data if present
      commits =
        case data do
          %{commits: commits_list} when is_list(commits_list) ->
            Enum.map(commits_list, fn commit ->
              {:ok, commit_data} = Commit.cast(commit)
              commit_data
            end)

          %{"commits" => commits_list} when is_list(commits_list) ->
            Enum.map(commits_list, fn commit ->
              {:ok, commit_data} = Commit.cast(commit)
              commit_data
            end)

          _ ->
            nil
        end

      # Cast branches data if present
      branches =
        case data do
          %{branches: branches_list} when is_list(branches_list) ->
            Enum.map(branches_list, fn branch ->
              {:ok, branch_data} = Branch.cast(branch)
              branch_data
            end)

          %{"branches" => branches_list} when is_list(branches_list) ->
            Enum.map(branches_list, fn branch ->
              {:ok, branch_data} = Branch.cast(branch)
              branch_data
            end)

          _ ->
            nil
        end

      # Cast tags data if present
      tags =
        case data do
          %{tags: tags_list} when is_list(tags_list) ->
            Enum.map(tags_list, fn tag ->
              {:ok, tag_data} = Tag.cast(tag)
              tag_data
            end)

          %{"tags" => tags_list} when is_list(tags_list) ->
            Enum.map(tags_list, fn tag ->
              {:ok, tag_data} = Tag.cast(tag)
              tag_data
            end)

          _ ->
            nil
        end

      {:ok,
       struct(__MODULE__, %{
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
         owner: owner,
         pulls: pulls,
         issues: issues,
         releases: releases,
         contributors: contributors,
         commits: commits,
         branches: branches,
         tags: tags
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
      {:ok,
       struct(__MODULE__, %{
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

  defmodule Release do
    @moduledoc """
    GitHub release data structure.
    """

    @type t :: %__MODULE__{
            id: integer(),
            tag_name: String.t(),
            target_commitish: String.t(),
            name: String.t() | nil,
            body: String.t() | nil,
            draft: boolean(),
            prerelease: boolean(),
            created_at: String.t(),
            published_at: String.t() | nil,
            author: User.t(),
            assets: list(map()),
            tarball_url: String.t(),
            zipball_url: String.t(),
            html_url: String.t(),
            url: String.t()
          }

    defstruct [
      :id,
      :tag_name,
      :target_commitish,
      :name,
      :body,
      :draft,
      :prerelease,
      :created_at,
      :published_at,
      :author,
      :assets,
      :tarball_url,
      :zipball_url,
      :html_url,
      :url
    ]

    @doc """
    Casts a GitHub release response to a Release struct.
    """
    def cast(data) when is_map(data) do
      {:ok,
       struct(__MODULE__, %{
         id: data["id"],
         tag_name: data["tag_name"],
         target_commitish: data["target_commitish"],
         name: data["name"],
         body: data["body"],
         draft: data["draft"],
         prerelease: data["prerelease"],
         created_at: data["created_at"],
         published_at: data["published_at"],
         author: Apipe.Providers.GitHub.Types.cast_user(data["author"]),
         assets: data["assets"] || [],
         tarball_url: data["tarball_url"],
         zipball_url: data["zipball_url"],
         html_url: data["html_url"],
         url: data["url"]
       })}
    end
  end

  defmodule Branch do
    @moduledoc """
    GitHub branch data structure.
    """

    @type t :: %__MODULE__{
            name: String.t(),
            commit: map(),
            protected: boolean(),
            protection: map() | nil,
            protection_url: String.t()
          }

    defstruct [
      :name,
      :commit,
      :protected,
      :protection,
      :protection_url
    ]

    @doc """
    Casts a GitHub branch response to a Branch struct.
    """
    def cast(data) when is_map(data) do
      {:ok,
       struct(__MODULE__, %{
         name: data["name"],
         commit: data["commit"],
         protected: data["protected"],
         protection: data["protection"],
         protection_url: data["protection_url"]
       })}
    end
  end

  defmodule Tag do
    @moduledoc """
    GitHub tag data structure.
    """

    @type t :: %__MODULE__{
            name: String.t(),
            commit: map(),
            zipball_url: String.t(),
            tarball_url: String.t(),
            node_id: String.t()
          }

    defstruct [
      :name,
      :commit,
      :zipball_url,
      :tarball_url,
      :node_id
    ]

    @doc """
    Casts a GitHub tag response to a Tag struct.
    """
    def cast(data) when is_map(data) do
      {:ok,
       struct(__MODULE__, %{
         name: data["name"],
         commit: data["commit"],
         zipball_url: data["zipball_url"],
         tarball_url: data["tarball_url"],
         node_id: data["node_id"]
       })}
    end
  end

  defmodule Commit do
    @moduledoc """
    GitHub commit data structure.
    """

    @type t :: %__MODULE__{
            sha: String.t(),
            node_id: String.t(),
            commit: map(),
            url: String.t(),
            html_url: String.t(),
            comments_url: String.t(),
            author: User.t() | nil,
            committer: User.t() | nil,
            parents: list(map())
          }

    defstruct [
      :sha,
      :node_id,
      :commit,
      :url,
      :html_url,
      :comments_url,
      :author,
      :committer,
      :parents
    ]

    @doc """
    Casts a GitHub commit response to a Commit struct.
    """
    def cast(data) when is_map(data) do
      {:ok,
       struct(__MODULE__, %{
         sha: data["sha"],
         node_id: data["node_id"],
         commit: data["commit"],
         url: data["url"],
         html_url: data["html_url"],
         comments_url: data["comments_url"],
         author: Apipe.Providers.GitHub.Types.cast_user(data["author"]),
         committer: Apipe.Providers.GitHub.Types.cast_user(data["committer"]),
         parents: data["parents"] || []
       })}
    end
  end

  defmodule Label do
    @moduledoc """
    GitHub label data structure.
    """

    @type t :: %__MODULE__{
            id: integer(),
            name: String.t(),
            color: String.t(),
            default: boolean(),
            description: String.t() | nil,
            node_id: String.t(),
            url: String.t()
          }

    defstruct [
      :id,
      :name,
      :color,
      :default,
      :description,
      :node_id,
      :url
    ]

    @doc """
    Casts a GitHub label response to a Label struct.
    """
    def cast(data) when is_map(data) do
      {:ok,
       struct(__MODULE__, %{
         id: data["id"],
         name: data["name"],
         color: data["color"],
         default: data["default"],
         description: data["description"],
         node_id: data["node_id"],
         url: data["url"]
       })}
    end
  end
end
