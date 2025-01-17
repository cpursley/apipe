defmodule Apipe.Response do
  @moduledoc """
  Represents a response from an API provider.

  ## Fields

    * `data` - The response data. Will be typed if using `cast`, raw JSON otherwise
    * `meta` - Additional metadata specific to the provider (rate limits, pagination info, etc.)
  """

  @type t :: %__MODULE__{
    data: any(),
    meta: map()
  }

  defstruct [:data, :meta]
end
