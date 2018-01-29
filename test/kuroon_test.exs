defmodule KuroonTest do
  use ExUnit.Case
  doctest Kuroon

  test "greets the world" do
    assert Kuroon.hello() == :world
  end
end
