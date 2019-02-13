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

## usage:

```elixir
  SlackNotification.notify(
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
config :slack_notification, url: get_env.("SLACK_WEBHOOK_URL")
```

to disable the actual push (in test environment for instance), you can disable it:

```elixir
config :slack_notification, enabled: false
```


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/slack_notification](https://hexdocs.pm/slack_notification).
