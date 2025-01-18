# Apipe

SQL-like interface for querying APIs

![Apipe mascot](mascot.jpeg)

What if you could query any API like you would a database? Introducing Apipe, a library that provides a SQL-like interface for querying APIs.

It works with a provider interface, so you can easily add support for new APIs. It currently supports the GitHub API, with more providers coming soon.

## Features

- SQL-like query interface
- Flexible filtering with map-based and chainable operators
- Optional type-safe responses with casting
- Comprehensive error handling
- Extensible provider system

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
alias Apipe.Providers.GitHub

# Create a new GitHub client with casting enabled (both token and casting are optional)
github = Apipe.new(GitHub, cast_response: true)

github
|> Apipe.from("repos/cpursley/apipe")
|> Apipe.execute()

# Using map-based where filters (with casting)
github
|> Apipe.from("search/repositories")
|> Apipe.where(%{
  language: "elixir",
  stars: [gt: 1000, lte: 10000],
  name: [like: "phoenix"]
})
|> Apipe.order_by("stars", :desc)
|> Apipe.limit(3)
|> Apipe.execute()

# Using chainable operators (without casting)
Apipe.new(GitHub)
|> Apipe.from("search/repositories")
|> Apipe.eq("language", "elixir")
|> Apipe.gt("stars", 1000)
|> Apipe.lte("stars", 10000)
|> Apipe.like("name", "phoenix")
|> Apipe.order_by("stars", :desc)
|> Apipe.limit(3)
|> Apipe.execute()

# Combining both styles (with casting)
github  # Using the client with casting enabled
|> Apipe.from("search/repositories")
|> Apipe.where(%{language: "elixir"})
|> Apipe.gt("stars", 1000)
|> Apipe.like("name", "phoenix")
|> Apipe.order_by("stars", :desc)
|> Apipe.limit(3)
|> Apipe.execute()
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

