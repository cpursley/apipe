defmodule ApipeTest do
  use ExUnit.Case
  doctest Apipe

  alias Apipe.{Query, Providers.GitHub}

  describe "new/2" do
    test "creates a new query with provider" do
      query = Apipe.new(GitHub)
      assert %Query{provider: GitHub} = query
    end

    test "creates a new query with provider and options" do
      query = Apipe.new(GitHub, token: "test_token")
      assert %Query{provider: GitHub, provider_opts: [token: "test_token"]} = query
    end
  end

  describe "from/2" do
    test "sets the from path" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")

      assert query.from == "search/repositories"
    end
  end

  describe "where/2" do
    test "adds a simple equality filter" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where(%{language: "elixir"})

      assert query.filters == [{:eq, "language", "elixir"}]
    end

    test "adds a comparison filter" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where(%{stars: [gt: 100]})

      assert query.filters == [{:gt, "stars", 100}]
    end

    test "adds multiple operators for same field" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where(%{stars: [gte: 100, lte: 1000]})

      assert query.filters == [
        {:lte, "stars", 1000},
        {:gte, "stars", 100}
      ]
    end

    test "adds multiple field filters" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where(%{
          language: "elixir",
          stars: [gt: 100],
          name: [like: "phoenix"]
        })

      assert query.filters == [
        {:like, "name", "phoenix"},
        {:eq, "language", "elixir"},
        {:gt, "stars", 100}
      ]
    end

    test "handles IN operator with list" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where(%{language: [in: ["elixir", "erlang"]]})

      assert query.filters == [{:in, "language", ["elixir", "erlang"]}]
    end

    test "handles NOT IN operator with list" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where(%{language: [nin: ["java", "python"]]})

      assert query.filters == [{:nin, "language", ["java", "python"]}]
    end

    test "handles text search operators" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where(%{
          description: [
            like: "%elixir%",
            ilike: "%phoenix%",
            nlike: "%deprecated%"
          ]
        })

      assert query.filters == [
        {:nlike, "description", "%deprecated%"},
        {:ilike, "description", "%phoenix%"},
        {:like, "description", "%elixir%"}
      ]
    end

    test "handles complex nested conditions" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where(%{
          language: [eq: "elixir", neq: "python"],
          stars: [gt: 100, lte: 1000],
          name: [like: "phoenix"],
          topics: [in: ["web", "api"]]
        })

      assert query.filters == [
        {:like, "name", "phoenix"},
        {:neq, "language", "python"},
        {:eq, "language", "elixir"},
        {:lte, "stars", 1000},
        {:gt, "stars", 100},
        {:in, "topics", ["web", "api"]}
      ]
    end

    test "in_list operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.in_list("language", ["elixir", "erlang"])

      assert query.filters == [{:in, "language", ["elixir", "erlang"]}]
    end
  end

  describe "order_by/3" do
    test "sets order by field and direction" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.order_by("stars", :desc)

      assert query.order_by == "stars"
      assert query.order_direction == :desc
    end
  end

  describe "limit/2" do
    test "sets the limit" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.limit(10)

      assert query.limit == 10
    end
  end

  describe "cast/2" do
    test "sets the cast type" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.cast(GitHub.Types.Repository)

      assert query.cast_type == GitHub.Types.Repository
    end
  end

  describe "chainable operators" do
    test "eq operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.eq("language", "elixir")

      assert query.filters == [{:eq, "language", "elixir"}]
    end

    test "neq operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.neq("language", "python")

      assert query.filters == [{:neq, "language", "python"}]
    end

    test "gt operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.gt("stars", 100)

      assert query.filters == [{:gt, "stars", 100}]
    end

    test "gte operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.gte("stars", 100)

      assert query.filters == [{:gte, "stars", 100}]
    end

    test "lt operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.lt("stars", 1000)

      assert query.filters == [{:lt, "stars", 1000}]
    end

    test "lte operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.lte("stars", 1000)

      assert query.filters == [{:lte, "stars", 1000}]
    end

    test "like operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.like("name", "%phoenix%")

      assert query.filters == [{:like, "name", "%phoenix%"}]
    end

    test "ilike operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.ilike("name", "%phoenix%")

      assert query.filters == [{:ilike, "name", "%phoenix%"}]
    end

    test "in_list operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.in_list("language", ["elixir", "erlang"])

      assert query.filters == [{:in, "language", ["elixir", "erlang"]}]
    end

    test "nin_list operator" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.nin_list("language", ["java", "python"])

      assert query.filters == [{:nin, "language", ["java", "python"]}]
    end

    test "chaining multiple operators" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.eq("language", "elixir")
        |> Apipe.gt("stars", 100)
        |> Apipe.lt("stars", 1000)
        |> Apipe.like("name", "%phoenix%")

      assert query.filters == [
        {:like, "name", "%phoenix%"},
        {:lt, "stars", 1000},
        {:gt, "stars", 100},
        {:eq, "language", "elixir"}
      ]
    end

    test "combining where with chainable operators" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where(%{language: "elixir"})
        |> Apipe.gt("stars", 100)
        |> Apipe.like("name", "%phoenix%")
        |> Apipe.where(%{topics: [in: ["web", "api"]]})

      assert query.filters == [
        {:in, "topics", ["web", "api"]},
        {:like, "name", "%phoenix%"},
        {:gt, "stars", 100},
        {:eq, "language", "elixir"}
      ]
    end

    test "conditional chaining" do
      filter_by_name = "phoenix"
      filter_pop_low = 100
      filter_pop_high = nil

      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")

      query =
        if filter_by_name,
          do: Apipe.like(query, "name", "%#{filter_by_name}%"),
          else: query

      query =
        if filter_pop_low,
          do: Apipe.gte(query, "stars", filter_pop_low),
          else: query

      query =
        if filter_pop_high,
          do: Apipe.lt(query, "stars", filter_pop_high),
          else: query

      assert query.filters == [
        {:gte, "stars", 100},
        {:like, "name", "%phoenix%"}
      ]
    end
  end
end
