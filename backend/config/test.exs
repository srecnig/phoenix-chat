use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :backend, BackendWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :backend, Backend.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "chat",
  password: "chat",
  database: "chat_test",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox
