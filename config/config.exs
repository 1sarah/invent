# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :inventory_management,
  ecto_repos: [InventoryManagement.Repo]

config :inventory_management, Guardian,
  issuer: "inventory_management",
  secret_key: "oj7I16IeHQDm+nnzeYZTtn5+4UcMcGDbMuhtgXjgjS4h2/DbOdJf4osC/aX2Kh6P"

# Configures the endpoint
config :inventory_management, InventoryManagementWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: InventoryManagementWeb.ErrorHTML, json: InventoryManagementWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: InventoryManagement.PubSub,
  live_view: [signing_salt: "D2VQ3/jN"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :inventory_management, InventoryManagement.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.2.7",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures hammer
config :hammer,
  backend: {Hammer.Backend.ETS, [expiry_ms: 60_000 * 60 * 4, cleanup_interval_ms: 60_000]}

# Configure cors_plug
config :cors_plug,
  origin: ["*"],
  max_age: 86400,
  methods: ["GET", "POST"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
