# |> Apipe

**SQL-like interface for querying APIs**

<img src="mascot.jpeg" width="250" style="float: left; margin-right: 30px; margin-bottom: 30px;" alt="Apipe mascot" />

What if you could query any API like you would a database? Introducing Apipe, a library that provides a SQL-like interface for querying APIs. It's Provider interface allows you to easily add support for new APIs.

### Features

* SQL-like query interface inspired by Supabase & Ecto
* Flexible filtering, joining and chainable operators
* Optional type-safe responses with casting
* Comprehensive error handling
* Extensible provider system

<br clear="left"/>

## Installation

Add `apipe` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:apipe, "~> 0.1.0"}
  ]
end
```

## Quickstart

```elixir
import Apipe
alias Apipe.Providers.GitHub

# Create a new GitHub client (both token and casting are optional)
github = Apipe.new(GitHub, cast_response: true)

github
|> from("repos/cpursley/apipe")
|> execute()
```

## Advanced

```elixir
# Using map-based where filters (with casting)
github
|> from("search/repositories")
|> where(%{language: "elixir", name: [like: "phoenix"], stars: [gt: 1000, lte: 10000]})
|> order_by(:stars, :desc)
|> limit(3)
|> execute()

# Query using chainable operators with select (without type casting)
Apipe.new(GitHub) # using the client with casting enabled
|> select([:id, :name, :stargazers_count])
|> from("search/repositories")
|> eq(:language, "elixir")
|> gt(:stars, 1000)
|> lte(:stars, 10000)
|> order_by(:stars, :desc)
|> limit(3)
|> execute()

# Combining both styles (with casting)
github # using the client with casting enabled (we set up earlier)
|> select(:name) # only name field will be cast to repository struct
|> from("search/repositories")
|> where(:language, eq: "elixir") # using field-operator syntax instead of maps
|> gt(:stars, 1000)
|> lte(:stars, 10000)
|> like(:name, "phoenix")
|> order_by(:stars, :desc)
|> limit(3)
|> execute()

# Joining related resources
github
|> from("search/repositories")
|> eq(:language, "elixir")
|> order_by(:updated) # Find repositories with recent activity
|> limit(3)
|> join(:contributors, fn repo -> # join top contributors
  github
  |> from("repos/#{repo["full_name"]}/contributors")
  |> limit(5)
end)
|> execute()
```

## Filter Operators

Apipe supports a variety of filter operators that can be used in both map-based `where` clauses and as chainable functions:

### Comparison Operators
- Equality: `where(%{field: value})` or `eq(field, value)`
- Not Equal: `where(%{field: [neq: value]})` or `neq(field, value)`
- Greater Than: `where(%{field: [gt: value]})` or `gt(field, value)`
- Greater Than or Equal: `where(%{field: [gte: value]})` or `gte(field, value)`
- Less Than: `where(%{field: [lt: value]})` or `lt(field, value)`
- Less Than or Equal: `where(%{field: [lte: value]})` or `lte(field, value)`

### List Operators
- IN: `where(%{field: [in: values]})` or `in_list(field, values)`
- NOT IN: `where(%{field: [nin: values]})` or `nin_list(field, values)`

### Pattern Matching
- LIKE: `where(%{field: [like: pattern]})` or `like(field, pattern)`
- Case-insensitive LIKE: `where(%{field: [ilike: pattern]})` or `ilike(field, pattern)`

### Multiple Operators
You can combine multiple operators for the same field in a where clause:
```elixir
where(%{stars: [gt: 100, lte: 1000]})
```

## Response Types

All responses are wrapped in a `Response` struct that includes:
- `data`: The actual response data (typed if using `cast_response: true`, raw JSON otherwise)
- Additional metadata specific to the provider (rate limits, pagination info, etc.)

## Type Casting

Type casting is configured when creating a new client with the `cast_response: true` option. When enabled, responses will be converted into Elixir structs with proper types. Without it, you'll get raw JSON responses. Choose based on your needs:

- Enable casting when you want:
  - Type safety
  - Better IDE support
  - Cleaner access to nested data
  - Example: `repo.full_name`, `repo.stargazers_count`

- Skip casting when you want:
  - Raw JSON responses
  - Better performance
  - To access fields not defined in the type structs
  - Example: `repo["full_name"]`, `repo["stargazers_count"]`

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License.

