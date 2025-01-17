# Apipe

What if you could query any API like you would a database? Introducing Apipe, a library that provides a SQL-like interface for querying APIs.

It works with a provider interface, so you can easily add support for new APIs. It currently supports the GitHub API, with more providers coming soon.

## Features

- SQL-like query interface (`select`, `where`, `order_by`, etc.)
- Type-safe responses with automatic casting (optional)
- Built-in rate limit handling
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

# Create a new GitHub client (token is optional)
github = Apipe.new(GitHub, token: "your_optional_github_token")

# Search for top Elixir repositories with type casting
{:ok, response} =
  github
  |> Apipe.from("search/repositories")
  |> Apipe.where("language", "elixir")
  |> Apipe.order_by("stars", :desc)
  |> Apipe.limit(3)
  |> Apipe.cast(GitHub.Types.Repository)
  |> Apipe.execute()

# Access the typed response
response.data.items |> Enum.each(fn repo ->
  IO.puts("#{repo.full_name}: #{repo.stargazers_count} ⭐")
end)

# Or query without type casting for raw JSON response
{:ok, response} =
  github
  |> Apipe.from("search/repositories")
  |> Apipe.where("language", "elixir")
  |> Apipe.select(["full_name", "stargazers_count"])
  |> Apipe.order_by("stars", :desc)
  |> Apipe.limit(3)
  |> Apipe.execute()

# Access the raw JSON response
response.data.items |> Enum.each(fn repo ->
  IO.puts("#{repo["full_name"]}: #{repo["stargazers_count"]} ⭐")
end)

# Rate limit information is included in both cases
IO.puts("Rate limit remaining: #{response.rate_limit.remaining}")
```

## Usage Examples

### Searching Repositories

```elixir
# Find Elixir repositories with more than 1000 stars
github
|> Apipe.from("search/repositories")
|> Apipe.where("language", "elixir")
|> Apipe.where("stars", ">1000")
|> Apipe.select(["id", "name", "description", "stargazers_count"])
|> Apipe.order_by("stars", :desc)
|> Apipe.cast(GitHub.Types.Repository)
|> Apipe.execute()
```

### Fetching Issues

```elixir
# Get open issues from a repository
github
|> Apipe.from("repos/elixir-lang/elixir/issues")
|> Apipe.where("state", "open")
|> Apipe.order_by("created", :desc)
|> Apipe.limit(5)
|> Apipe.cast(GitHub.Types.Issue)
|> Apipe.execute()
```

### Searching Users

```elixir
# Find users with "elixir" in their bio
github
|> Apipe.from("search/users")
|> Apipe.where("bio", "elixir")
|> Apipe.order_by("followers", :desc)
|> Apipe.limit(10)
|> Apipe.cast(GitHub.Types.User)
|> Apipe.execute()

# Or without type casting for raw JSON
github
|> Apipe.from("search/users")
|> Apipe.where("bio", "elixir")
|> Apipe.select(["login", "bio", "followers"])
|> Apipe.order_by("followers", :desc)
|> Apipe.limit(10)
|> Apipe.execute()
```

## Response Types

All responses are wrapped in a `Response` struct that includes:
- `data`: The actual response data (typed if using `cast`, raw JSON otherwise)
- Additional metadata specific to the provider (rate limits, pagination info, etc.)

## Type Casting

Type casting is optional. When you use `cast/2`, the response will be converted into Elixir structs with proper types. Without casting, you'll get the raw JSON response from the API. Choose based on your needs:

- Use casting when you want:
  - Type safety
  - Better IDE support
  - Cleaner access to nested data

- Skip casting when you want:
  - Raw JSON responses
  - Better performance
  - To access fields not defined in the type structs

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License.

