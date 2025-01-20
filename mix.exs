defmodule Apipe.MixProject do
  use Mix.Project

  def project do
    [
      app: :apipe,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.14"},
      {:plug_cowboy, "~> 2.6"},
      {:jason, "~> 1.4"},
      {:req, "~> 0.5"},

      # Providers
      {:oapi_generator, "~> 0.2.0", only: :dev, runtime: false},

      # Dev
      {:ex_doc, "~> 0.36.1"}
    ]
  end
end
