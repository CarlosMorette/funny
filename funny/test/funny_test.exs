defmodule FunnyTest do
  use ExUnit.Case
  doctest Funny

  test "greets the world" do
    assert Funny.hello() == :world
  end
end
