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

  describe "where/3" do
    test "adds a filter" do
      query =
        GitHub
        |> Apipe.new()
        |> Apipe.from("search/repositories")
        |> Apipe.where("language", "elixir")

      assert query.filters == [{:eq, "language", "elixir"}]
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
end
