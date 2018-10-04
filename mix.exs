defmodule Geolix.Plug.Mixfile do
  use Mix.Project

  @url_github "https://github.com/elixir-geolix/plug"

  def project do
    [
      app: :geolix_plug,
      name: "Geolix Plug",
      version: "0.1.0-dev",
      elixir: "~> 1.3",
      deps: deps(),
      description: "Geolix Plug",
      docs: docs(),
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.travis": :test
      ],
      test_coverage: [tool: ExCoveralls]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:excoveralls, "~> 0.8", only: :test},
      {:geolix, "~> 0.17", optional: true},
      {:geolix_testdata, "~> 0.3.0", only: :test},
      {:plug, "~> 1.4", optional: true}
    ]
  end

  defp docs do
    [
      main: "Geolix.Plug",
      source_ref: "master",
      source_url: @url_github
    ]
  end

  defp package do
    %{
      files: ["CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @url_github},
      maintainers: ["Marc Neudert"]
    }
  end
end
