# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :helloplug, Helloplug.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  port: 587,
  username: System.get_env("SMTP_USERNAME"),
  password: System.get_env("SMTP_PASSWORD"),
  tls: :if_available,
  allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"],
  ssl: false,
  retries: 1

