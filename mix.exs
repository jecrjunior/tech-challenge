defmodule FinancialSystem.Mixfile do
  use Mix.Project

  def project do
    [
      app: :financial_system,
      version: "0.1.0",
      compilers: Mix.compilers ++ [:cldr],
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      escript: escript(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about appl  ications.
  def application do
    [
      mod: {FinancialSystem, []},
      applications: [:ex_cldr, :logger]
    ]
  end

  defp escript do
    [main_module: FinancialSystem]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:decimal, "~> 1.0"},
      {:ex_cldr, "~> 1.0"},
      {:poison, "~> 2.1 or ~> 3.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end