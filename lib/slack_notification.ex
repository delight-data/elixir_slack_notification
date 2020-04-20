defmodule SlackNotification do
  @moduledoc """
  Notify a map to a url webhook, asynchronously, fire and forget behavior
  """
  use Tesla
  require Logger

  @color %{
    error: "#f00",
    warn: "#ff8300",
    info: "#3287c1",
    success: "#0f0"
  }

  plug(Tesla.Middleware.JSON)

  def config, do: Application.get_all_env(:slack_notification)

  def notify!(url, attachments), do: if(config()[:enabled] != false, do: post(url, attachments))

  def notify(level, text, context \\ %{}), do: notify_channel(:default, level, text, context)

  def notify_channel(channel, level, text, context \\ %{}) do
    attachments = %{
      text: text,
      attachments: [
        %{
          color: @color[level] || "#f00",
          ts: DateTime.utc_now() |> DateTime.to_unix(),
          fields: Enum.map(context, fn {k, v} -> %{title: k, value: inspect(v)} end)
        }
      ]
    }

    channel_url = url(channel)
    unless channel_url, do: raise("Unconfigured url for channel #{channel}")

    if config()[:async] != false do
      spawn(__MODULE__, :notify!, [channel_url, attachments])
    else
      notify!(channel_url, attachments)
    end
  end

  defp url(:default), do: config()[:url]
  defp url(channel), do: config()[:channels][channel]
end
