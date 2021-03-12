defmodule Procore.MixProject do
  use Mix.Project

  @description """
    Simple Elixir wrapper for the Procore API
  """

  def project do
    [
      app: :procore,
      deps: deps(),
      description: @description,
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      start_permanent: Mix.env() == :prod,
      version: "1.0.0"
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
      {:cachex, "~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:jason, "~> 1.0"},
      {:tesla, "1.0.0"},
      {:hackney, "~> 1.12"},
      {:recase, "~> 0.2"}
    ]
  end

  defp package do
    [
      maintainers: ["Michael Stock", "Jason Gittler"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/procore/elixir-sdk"}
    ]
  end
end
