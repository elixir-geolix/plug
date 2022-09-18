defmodule Geolix.Plug.MixProject do
  use Mix.Project

  @url_changelog "https://hexdocs.pm/geolix_plug/changelog.html"
  @url_github "https://github.com/elixir-geolix/plug"
  @version "0.3.0-dev"

  def project do
    [
      app: :geolix_plug,
      name: "Geolix Plug",
      version: @version,
      elixir: "~> 1.9",
      deps: deps(),
      description: "Geolix Plug",
      dialyzer: dialyzer(),
      docs: docs(),
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test
      ],
      test_coverage: [tool: ExCoveralls]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: :dev, runtime: false},
      {:dialyxir, "~> 1.2", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.14.0", only: :test},
      {:geolix, "~> 2.0"},
      {:plug, "~> 1.0"}
    ]
  end

  defp dialyzer do
    [
      flags: [
        :error_handling,
        :underspecs,
        :unmatched_returns
      ],
      plt_core_path: "plts",
      plt_local_path: "plts"
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md",
        LICENSE: [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "Geolix.Plug",
      source_ref: "v#{@version}",
      source_url: @url_github,
      formatters: ["html"]
    ]
  end

  defp package do
    [
      files: ["CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib"],
      licenses: ["Apache-2.0"],
      links: %{
        "Changelog" => @url_changelog,
        "GitHub" => @url_github
      }
    ]
  end
end
