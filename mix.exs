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
      elixir: "~> 1.6.0",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      start_permanent: Mix.env() == :prod,
      version: "0.0.1"
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
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:poison, "~> 3.1"},
      {:tesla, "1.0.0-beta.1"}
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
