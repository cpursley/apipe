defmodule Apipe.Provider.Settings do
  @moduledoc """
  Default settings for Apipe providers.

  ## Fields
    * `:max_concurrency` - Maximum number of concurrent requests for joins (default: 3)
    * `:join_strategy` - Strategy for executing joins, either `:async` or `:sync` (default: `:async`)
    * `:retry_options` - Options passed to Req's retry mechanism
  """

  defstruct [
    max_concurrency: 3,
    join_strategy: :async,
    retry: :safe_transient
  ]
end
