defmodule SlackNotificationTest do
  use ExUnit.Case
  doctest SlackNotification

  test "greets the world" do
    assert SlackNotification.hello() == :world
  end
end
