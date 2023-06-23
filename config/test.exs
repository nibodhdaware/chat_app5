import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :chat_app5, ChatApp5.Repo,
  username: "root",
  password: "",
  hostname: "localhost",
  database: "chat_app5_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chat_app5, ChatApp5Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "lxut0rAksfdrEHegCZmyZaShC65TBFHC2r/SFEUrGbq1p8g1wBiVl9Fx3VWapRhb",
  server: false

# In test we don't send emails.
config :chat_app5, ChatApp5.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
