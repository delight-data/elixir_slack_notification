defmodule SlackNotification do
  @moduledoc """
  Notify a map to a url webhook, asynchronously, fire and forget behavior
  """

  use HTTPoison.Base

  require Logger

  @color %{
    error: "#f00",
    warn: "#ff8300",
    info: "#3287c1",
    success: "#0f0"
  }

  # Fix SSL see: https://hexdocs.pm/httpoison/readme.html#note-about-broken-ssl-in-erlang-19
  @default_options [ssl: [{:versions, [:"tlsv1.2"]}]]

  def config, do: Application.get_all_env(:slack_notification)

  def process_request_headers(_headers), do: [{"Content-type", "application/json"}]
  def process_request_options(options), do: options ++ @default_options
  def process_request_body(body), do: body |> Poison.encode!()

  def notify!(url, attachments), do: if(config()[:enabled] != false, do: post(url, attachments))

  def notify(level, text, context \\ %{}), do: notify_channel(:default, level, text, context)

  def notify_channel(channel, level, text, context \\ %{}) do
    attachments = %{
      text: text,
      attachments: [
        %{
          color: @color[level] || "#f00",
          ts: Timex.now() |> Timex.to_unix(),
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
