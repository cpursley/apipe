defmodule GitHubOpenAPI.DependencyGraph do
  @moduledoc """
  Provides API endpoints related to dependency graph
  """

  @default_client GitHubOpenAPI.Client

  @type create_repository_snapshot_201_json_resp :: %{
          __info__: map,
          __joins__: map,
          created_at: String.t(),
          id: integer,
          message: String.t(),
          result: String.t()
        }

  @doc """
  Create a snapshot of dependencies for a repository

  Create a new snapshot of a repository's dependencies.

  The authenticated user must have access to the repository.

  OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependency-graph/dependency-submission#create-a-snapshot-of-dependencies-for-a-repository)

  """
  @spec create_repository_snapshot(String.t(), String.t(), GitHubOpenAPI.Snapshot.t(), keyword) ::
          {:ok, map} | :error
  def create_repository_snapshot(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHubOpenAPI.DependencyGraph, :create_repository_snapshot},
      url: "/repos/#{owner}/#{repo}/dependency-graph/snapshots",
      body: body,
      method: :post,
      request: [{"application/json", {GitHubOpenAPI.Snapshot, :t}}],
      response: [
        {201, {GitHubOpenAPI.DependencyGraph, :create_repository_snapshot_201_json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a diff of the dependencies between commits

  Gets the diff of the dependency changes between two commits of a repository, based on the changes to the dependency manifests made in those commits.

  ## Options

    * `name`: The full path, relative to the repository root, of the dependency manifest file.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependency-graph/dependency-review#get-a-diff-of-the-dependencies-between-commits)

  """
  @spec diff_range(String.t(), String.t(), String.t(), keyword) ::
          {:ok, [GitHubOpenAPI.DependencyGraphDiff.t()]} | {:error, GitHubOpenAPI.BasicError.t()}
  def diff_range(owner, repo, basehead, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:name])

    client.request(%{
      args: [owner: owner, repo: repo, basehead: basehead],
      call: {GitHubOpenAPI.DependencyGraph, :diff_range},
      url: "/repos/#{owner}/#{repo}/dependency-graph/compare/#{basehead}",
      method: :get,
      query: query,
      response: [
        {200, [{GitHubOpenAPI.DependencyGraphDiff, :t}]},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Export a software bill of materials (SBOM) for a repository.

  Exports the software bill of materials (SBOM) for a repository in SPDX JSON format.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/dependency-graph/sboms#export-a-software-bill-of-materials-sbom-for-a-repository)

  """
  @spec export_sbom(String.t(), String.t(), keyword) ::
          {:ok, GitHubOpenAPI.DependencyGraphSpdxSbom.t()}
          | {:error, GitHubOpenAPI.BasicError.t()}
  def export_sbom(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHubOpenAPI.DependencyGraph, :export_sbom},
      url: "/repos/#{owner}/#{repo}/dependency-graph/sbom",
      method: :get,
      response: [
        {200, {GitHubOpenAPI.DependencyGraphSpdxSbom, :t}},
        {403, {GitHubOpenAPI.BasicError, :t}},
        {404, {GitHubOpenAPI.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_repository_snapshot_201_json_resp) do
    [
      created_at: {:string, :generic},
      id: :integer,
      message: {:string, :generic},
      result: {:string, :generic}
    ]
  end
end
