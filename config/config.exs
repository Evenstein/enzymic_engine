# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :enzymic_engine,
  ecto_repos: [EnzymicEngine.Repo, EnzymicEngine.StatsRepo]

# Configures the endpoint
config :enzymic_engine, EnzymicEngineWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pI8QbOfSA0jYoEJWWhMyxZ+0c0xEq9L8YjCeqnek1mR+Ivf2xflXd5pplo10DajF",
  render_errors: [view: EnzymicEngineWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EnzymicEngine.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
