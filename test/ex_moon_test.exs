defmodule ExMoonTest do
  use ExUnit.Case
  doctest ExMoon

  test "greets the world" do
    assert ExMoon.hello() == :world
  end
end
