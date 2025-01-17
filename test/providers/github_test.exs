defmodule Apipe.Providers.GitHubTest do
  use ExUnit.Case
  alias Apipe.{Query, Providers.GitHub}

  # GitHub-specific test helpers
  defp mock_github_response(status, body, headers \\ %{}) do
    %{
      status: status,
      body: body,
      headers: Map.merge(default_github_headers(), headers)
    }
  end

  defp default_github_headers do
    %{
      "x-ratelimit-limit" => ["10"],
      "x-ratelimit-remaining" => ["9"],
      "x-ratelimit-reset" => ["1737125213"],
      "x-ratelimit-used" => ["1"]
    }
  end

  describe "build_search_query/1" do
    test "handles user bio search correctly" do
      query = %Query{
        provider: GitHub,
        from: "search/users",
        filters: [{:eq, "bio", "elixir"}]
      }

      assert GitHub.build_search_query(query) == "elixir in:bio"
    end

    test "handles repository search with numeric comparison" do
      query = %Query{
        provider: GitHub,
        from: "search/repositories",
        filters: [{:eq, "stars", ">1000"}]
      }

      assert GitHub.build_search_query(query) == "stars:>1000"
    end

    test "combines multiple filters correctly" do
      query = %Query{
        provider: GitHub,
        from: "search/repositories",
        filters: [
          {:eq, "language", "elixir"},
          {:eq, "stars", ">1000"}
        ]
      }

      assert GitHub.build_search_query(query) == "language:elixir stars:>1000"
    end

    test "handles user search with multiple criteria" do
      query = %Query{
        provider: GitHub,
        from: "search/users",
        filters: [
          {:eq, "bio", "elixir"},
          {:eq, "location", "San Francisco"}
        ]
      }

      assert GitHub.build_search_query(query) == "elixir in:bio San Francisco in:location"
    end
  end

  describe "build_params/1" do
    test "includes pagination parameters" do
      query = %Query{
        provider: GitHub,
        from: "search/repositories",
        limit: 10,
        offset: 20
      }

      params = GitHub.build_params(query)
      assert params.per_page == 10
      assert params.page == 3  # (20 / 10) + 1
    end

    test "includes sorting parameters" do
      query = %Query{
        provider: GitHub,
        from: "search/repositories",
        order_by: "stars",
        order_direction: :desc
      }

      params = GitHub.build_params(query)
      assert params.sort == "stars"
      assert params.order == :desc
    end
  end

  describe "process_response/2" do
    test "handles successful search response" do
      response = mock_github_response(200, %{
        "items" => [
          %{"id" => 1, "name" => "elixir", "stargazers_count" => 1000}
        ],
        "total_count" => 1,
        "incomplete_results" => false
      })

      query = %Query{
        provider: GitHub,
        from: "search/repositories",
        cast_type: GitHub.Types.Repository
      }

      assert {:ok, _} = GitHub.process_response(response, query)
    end

    test "handles error response" do
      response = mock_github_response(422, %{
        "message" => "Validation Failed",
        "errors" => [
          %{
            "resource" => "Search",
            "field" => "q",
            "code" => "invalid"
          }
        ]
      })

      query = %Query{
        provider: GitHub,
        from: "search/repositories"
      }

      assert {:error, error} = GitHub.process_response(response, query)
      assert error.type == :provider_error
      assert error.message == "GitHub API error"
    end
  end
end
