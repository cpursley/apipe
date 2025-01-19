defmodule Apipe.Providers.GitHubTest do
  use ExUnit.Case, async: true
  alias Apipe.{Query, Providers.GitHub}

  describe "execute/2" do
    test "returns error for unsupported endpoint" do
      query = %Query{
        provider: GitHub,
        from: "invalid/endpoint"
      }

      assert %Apipe.Error{
               type: :provider_error,
               message: "Unsupported endpoint"
             } = GitHub.execute(query)
    end

    test "search/repositories returns repository results" do
      response =
        mock_github_response(200, %{
          "total_count" => 1,
          "incomplete_results" => false,
          "items" => [
            %{
              "id" => 1234,
              "name" => "elixir",
              "full_name" => "elixir-lang/elixir",
              "description" => "Dynamic, functional language",
              "stargazers_count" => 1000,
              "language" => "Elixir",
              "owner" => %{"id" => 1, "login" => "elixir-lang"}
            }
          ]
        })

      # Test uncasted (raw map) response
      query = %Query{
        provider: GitHub,
        from: "search/repositories",
        filters: [{:eq, "language", "elixir"}]
      }

      result = GitHub.execute(query, test_response: response)
      assert %Apipe.Response{} = result
      assert length(result.data) == 1
      assert (result.data |> hd)["name"] == "elixir"

      # Test casted (struct) response
      result = GitHub.execute(query, test_response: response, cast_response: true)
      assert %Apipe.Response{} = result
      assert length(result.data) == 1
      assert (result.data |> hd).name == "elixir"
      assert %Apipe.Providers.GitHub.Types.Repository{} = hd(result.data)
    end

    test "search/users returns user results" do
      response =
        mock_github_response(200, %{
          "total_count" => 1,
          "incomplete_results" => false,
          "items" => [
            %{
              "id" => 1,
              "login" => "octocat",
              "type" => "User",
              "location" => "San Francisco"
            }
          ]
        })

      # Test uncasted (raw map) response
      query = %Query{
        provider: GitHub,
        from: "search/users",
        filters: [{:eq, "location", "San Francisco"}]
      }

      result = GitHub.execute(query, test_response: response)
      assert %Apipe.Response{} = result
      assert length(result.data) == 1
      assert (result.data |> hd)["login"] == "octocat"

      # Test casted (struct) response
      result = GitHub.execute(query, test_response: response, cast_response: true)
      assert %Apipe.Response{} = result
      assert length(result.data) == 1
      assert (result.data |> hd).login == "octocat"
      assert %Apipe.Providers.GitHub.Types.User{} = hd(result.data)
    end

    test "search/code returns code results" do
      response =
        mock_github_response(200, %{
          "total_count" => 1,
          "incomplete_results" => false,
          "items" => [
            %{
              "name" => "mix.exs",
              "path" => "mix.exs",
              "repository" => %{"full_name" => "elixir-lang/elixir"},
              "html_url" => "https://github.com/elixir-lang/elixir/blob/main/mix.exs"
            }
          ]
        })

      query = %Query{
        provider: GitHub,
        from: "search/code",
        filters: [{:eq, "language", "elixir"}],
        provider_opts: [cast_response: true]
      }

      assert {:ok, {data, _}} = GitHub.process_response(response, query)
      assert length(data) == 1
      assert data |> hd |> Map.get("name") == "mix.exs"
    end

    test "search/issues returns issue results" do
      response =
        mock_github_response(200, %{
          "total_count" => 1,
          "incomplete_results" => false,
          "items" => [
            %{
              "id" => 1,
              "number" => 123,
              "title" => "Bug fix",
              "state" => "open",
              "user" => %{"id" => 1, "login" => "octocat"}
            }
          ]
        })

      # Test uncasted (raw map) response
      query = %Query{
        provider: GitHub,
        from: "search/issues",
        filters: [{:eq, "state", "open"}]
      }

      result = GitHub.execute(query, test_response: response)
      assert %Apipe.Response{} = result
      assert length(result.data) == 1
      assert (result.data |> hd)["title"] == "Bug fix"

      # Test casted (struct) response
      result = GitHub.execute(query, test_response: response, cast_response: true)
      assert %Apipe.Response{} = result
      assert length(result.data) == 1
      assert (result.data |> hd).title == "Bug fix"
      assert %Apipe.Providers.GitHub.Types.Issue{} = hd(result.data)
    end

    test "search/topics returns topic results" do
      response =
        mock_github_response(200, %{
          "total_count" => 1,
          "incomplete_results" => false,
          "items" => [
            %{
              "name" => "elixir",
              "display_name" => "Elixir",
              "short_description" => "Elixir is a dynamic, functional language",
              "created_by" => "José Valim",
              "released" => "2011"
            }
          ]
        })

      # Test uncasted (raw map) response
      query = %Query{
        provider: GitHub,
        from: "search/topics",
        filters: [{:eq, "name", "elixir"}]
      }

      result = GitHub.execute(query, test_response: response)
      assert %Apipe.Response{} = result
      assert length(result.data) == 1
      assert (result.data |> hd)["name"] == "elixir"

      # Test casted (struct) response
      result = GitHub.execute(query, test_response: response, cast_response: true)
      assert %Apipe.Response{} = result
      assert length(result.data) == 1
      assert (result.data |> hd).name == "elixir"
      assert %Apipe.Providers.GitHub.Types.Topic{} = hd(result.data)
    end

    test "repos/{owner}/{repo} returns repository details" do
      response =
        mock_github_response(200, %{
          "id" => 1234,
          "name" => "elixir",
          "full_name" => "elixir-lang/elixir",
          "description" => "Dynamic, functional language",
          "stargazers_count" => 1000,
          "language" => "Elixir",
          "owner" => %{"id" => 1, "login" => "elixir-lang"}
        })

      # Test uncasted (raw map) response
      query = %Query{
        provider: GitHub,
        from: "repos/elixir-lang/elixir"
      }

      result = GitHub.execute(query, test_response: response)
      assert %Apipe.Response{} = result
      assert result.data["name"] == "elixir"
      assert result.data["full_name"] == "elixir-lang/elixir"

      # Test casted (struct) response
      result = GitHub.execute(query, test_response: response, cast_response: true)
      assert %Apipe.Response{} = result
      assert result.data.name == "elixir"
      assert result.data.full_name == "elixir-lang/elixir"
      assert %Apipe.Providers.GitHub.Types.Repository{} = result.data
    end

    test "repos/{owner}/{repo} returns repository details with casting" do
      response =
        mock_github_response(200, %{
          "id" => 1234,
          "name" => "elixir",
          "full_name" => "elixir-lang/elixir",
          "description" => "Dynamic, functional language",
          "stargazers_count" => 1000,
          "language" => "Elixir",
          "owner" => %{
            "id" => 1_481_354,
            "login" => "elixir-lang",
            "type" => "Organization"
          }
        })

      query = %Query{
        provider: GitHub,
        from: "repos/elixir-lang/elixir"
      }

      result = GitHub.execute(query, test_response: response, cast_response: true)
      assert %Apipe.Response{} = result

      # Verify repository is cast
      assert %Apipe.Providers.GitHub.Types.Repository{} = result.data
      assert result.data.name == "elixir"
      assert result.data.full_name == "elixir-lang/elixir"

      # Verify owner is cast
      assert %Apipe.Providers.GitHub.Types.User{} = result.data.owner
      assert result.data.owner.id == 1_481_354
      assert result.data.owner.login == "elixir-lang"
    end
  end

  defp mock_github_response(status, body) do
    %{
      status: status,
      body: body,
      headers: [
        {"x-ratelimit-limit", "60"},
        {"x-ratelimit-remaining", "59"},
        {"x-ratelimit-reset", "1234567890"},
        {"x-ratelimit-used", "1"}
      ]
    }
  end
end
