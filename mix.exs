defmodule Kuroon.Mixfile do
  use Mix.Project

  def project do
    [
      app: :kuroon,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :porcelain],
      mod: {Kuroon.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:porcelain, "~> 2.0"},
      {:secure_random, "~> 0.5.1"},
      {:excoveralls, "~> 0.8", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
  
  
  # Package Information
  defp package do
    [
      files: ["test", "lib", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["Dunya Kirkali", "Onur Kucukkece"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ahtung/kuroon.ex"}
    ]
  end

  # Package description
  defp description do
    """
    Cloning will enable mankind to reach eternal life.
    """
  end
end
