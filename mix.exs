defmodule KinoDB.MixProject do
  use Mix.Project

  @version "0.2.4"
  @description "Databases integration with Livebook"

  def project do
    [
      app: :kino_db,
      version: @version,
      description: @description,
      name: "KinoDB",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      mod: {KinoDB.Application, []}
    ]
  end

  defp deps do
    [
      {:kino, "~> 0.7"},
      {:table, "~> 0.1"},
      {:postgrex, "~> 0.17.3 or ~> 0.18", optional: true},
      {:exqlite, "~> 0.11", optional: true},
      {:myxql, "~> 0.6.2 or ~> 0.7", optional: true},
      {:tds, "~> 2.3.4 or ~> 2.4", optional: true},
      {:db_connection, "~> 2.4.2 or ~> 2.5", optional: true},

      # Those dependecies are new, so we use stricter versions
      {:adbc, "~> 0.1.1", optional: true},
      {:explorer, "~> 0.7.0", optional: true},
      {:req_bigquery, "~> 0.1.0", optional: true},
      {:req_athena, "~> 0.1.1", optional: true},

      # Dev only
      {:ex_doc, "~> 0.28", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "components",
      source_url: "https://github.com/livebook-dev/kino_db",
      source_ref: "v#{@version}",
      extras: ["guides/components.livemd"]
    ]
  end

  def package do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/livebook-dev/kino_db"
      }
    ]
  end
end
