defmodule Decimal.Mixfile do
  use Mix.Project

  @version "1.7.1-dev"

  def project() do
    [
      app: :decimal,
      version: @version,
      elixir: "~> 1.0",
      elixirc_paths: elixirc_paths(Mix.env()),
      preferred_cli_env: [
        bench: :bench
      ],
      consolidate_protocols: Mix.env() in [:prod, :bench],
      deps: deps(),
      name: "Decimal",
      source_url: "https://github.com/ericmj/decimal",
      docs: [source_ref: "v#{@version}", main: "readme", extras: ["README.md"]],
      description: description(),
      package: package()
    ]
  end

  def application() do
    []
  end

  defp deps() do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:benchfella, "~> 0.3.0", only: :bench, runtime: false},
      {:equalable, "~> 0.1.0"},
      {:comparable, github: "coingaming/comparable"}
    ]
  end

  defp description() do
    "Arbitrary precision decimal arithmetic."
  end

  defp package() do
    [
      maintainers: ["Eric Meadows-Jönsson"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ericmj/decimal"}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:bench), do: ["lib", "bench/support"]
  defp elixirc_paths(:dev), do: ["lib"]
  defp elixirc_paths(_), do: ["lib"]
end
