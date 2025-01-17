defmodule ApipeTest do
  use ExUnit.Case
  doctest Apipe

  test "greets the world" do
    assert Apipe.hello() == :world
  end
end
