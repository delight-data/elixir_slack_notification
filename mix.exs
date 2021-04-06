defmodule SlackNotification.MixProject do
  use Mix.Project

  def project do
    [
      app: :slack_notification,
      version: "0.1.1",
      elixir: ">=1.7.0",
      start_permanent: Mix.env() == :prod,
      description:
        "A simple wrapper to asynchronously push slack notifications wit attachement generated from an elixir map with [error, warn info, success] level and color.",
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      licenses: ["GNU GPLv3"],
      links: %{"GitHub" => "https://github.com/delight-data/elixir_slack_notification"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "> 1.3.0"},
      {:jason, ">= 1.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
