use Mix.Config

config :nerves_hub_api, NervesHubAPIWeb.Endpoint,
  load_from_system_env: true,
  url: [host: "api.nerves-hub.org"],
  pubsub: [name: NervesHubWeb.PubSub,
           adapter: Phoenix.PubSub.PG2],
  server: true,
  https: [
    port: 443,
    otp_app: :nerves_hub_api,
    # Enable client SSL
    verify: :verify_peer,
    keyfile: "/etc/cfssl/server-key.pem",
    certfile: "/etc/cfssl/server.pem",
    cacertfile: "/etc/cfssl/ca.pem"
  ]

# Do not print debug messages in production
config :logger, level: :debug