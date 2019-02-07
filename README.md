# SlackNotification

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `slack_notification` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:slack_notification, git: "git://github.com/delight-data/elixir_slack_notification.git", branch: "master"}
  ]
end
```

configure:

```elixir
config :slack_notification, url: get_env.("SLACK_WEBHOOK_URL")
```

usage:

```elixir
  SlackNotification.notify(
    :info,
    "Wonderful notification",
    %{
      size: 12,
      name: "george"
    }
  )
```


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/slack_notification](https://hexdocs.pm/slack_notification).
