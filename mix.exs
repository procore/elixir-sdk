defmodule Procore.MixProject do
  use Mix.Project

  def project do
    [
      app: :procore,
      deps: deps(),
      elixir: "~> 1.6.0",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      version: "0.1.0",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Procore.Application, []}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/mocks"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cachex, "~> 2.1"},
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:retry, "~> 0.8"},
    ]
  end
end
