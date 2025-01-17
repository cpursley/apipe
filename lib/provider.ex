defmodule Apipe.Provider do
  @callback execute(Apipe.Query.t(), keyword()) :: {:ok, any()} | {:error, Apipe.Error.t()}
end
