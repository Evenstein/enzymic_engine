use Mix.Config

config :enzymic_engine, :salt, "Please, don't hack me!"
config :enzymic_engine, :additive, 0
config :enzymic_engine, :static_url, "http://localhost:3001/ads/"
config :enzymic_engine, :stats_url, "http://localhost:4001"
config :enzymic_engine, :lead_gen_url, "http://localhost:3001/ads/"
config :enzymic_engine, :ml_model_path, "./model.json"

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :enzymic_engine, EnzymicEngineWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :enzymic_engine, EnzymicEngineWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/enzymic_engine_web/views/.*(ex)$},
      ~r{lib/enzymic_engine_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation enzymic_engine_dev
config :phoenix, :plug_init_mode, :runtime

# Configure your database
config :enzymic_engine, EnzymicEngine.Repo,
  username: "enzymic",
  password: "enzymic",
  database: "enzymic_development",
  hostname: "localhost",
  pool_size: 10

config :enzymic_engine, EnzymicEngine.StatsRepo,
  adapter: Ecto.Adapters.Postgres,
  username: "enzymic",
  password: "enzymic",
  database: "stats_dev",
  hostname: "localhost",
  port: "5432",
  pool_size: 10