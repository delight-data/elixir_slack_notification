# SlackNotification

A simple wrapper to asynchronously push slack notifications wit attachement generated from an elixir map with [error, warn info, success] level and color.

## Installation

Add to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:slack_notification, git: "git://github.com/delight-data/elixir_slack_notification.git", tag: "v1.0.1"}
  ]
end
```

## Typical usage:


```elixir
  SlackNotification.notify(
    :info,
    "User `john@delight-data.com` created an account",
    %{id: "01D3KF1K6SSZBMKXQ5NGQGX23M"}
  )
```

You will receive:

![info sample](https://raw.githubusercontent.com/delight-data/elixir_slack_notification/master/info_slack_webhook.png)

or with:

```elixir
  SlackNotification.notify(
    :error,
    "User `john@delight-data.com` tried to hack you !",
    %{id: "01D3KF1K6SSZBMKXQ5NGQGX23M", method: "the worst one!"}
  )
```

You will receive:

![info sample](https://raw.githubusercontent.com/delight-data/elixir_slack_notification/master/error_slack_webhook.png)


### configuration:

```elixir
config :slack_notification, url: "https://hooks.slack.com/services/<yours>/<yours>/<yours>"
```

to disable the actual push (in test environment for instance), you can disable it:

```elixir
config :slack_notification, enabled: false
```

## Multiple channel slack notifications


```elixir
  SlackNotification.notify_channel(
    :com,
    :info,
    "Wonderful notification title",
    %{
      size: 12,
      name: "george"
    }
  )
```

### configuration:

```elixir
config :slack_notification,
  url: "https://hooks.slack.com/services/<yours>/<yours>/<yours>",
  channels: %{
    com: "https://hooks.slack.com/services/<yours>/<yours>/<yours>"
  }
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/slack_notification](https://hexdocs.pm/slack_notification).
