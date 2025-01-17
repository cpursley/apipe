ExUnit.start()

defmodule Apipe.TestHelpers do
  def mock_response(status \\ 200, body \\ %{}, headers \\ %{}) do
    %{
      status: status,
      body: body,
      headers: headers
    }
  end
end
