defmodule SlackNotificationTest do
  use ExUnit.Case
  doctest SlackNotification

  describe "basic testing" do
    test "a send shouldn't crash" do
      assert SlackNotification.notify(:info, "hello friend", %{id: 12})
    end

    test "custom channel" do
      assert SlackNotification.notify_channel(:special, :info, "hello dark friend", %{id: 15})
    end
  end
end
