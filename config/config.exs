use Mix.Config

config :procore,
  http_client: Procore.HttpClient,
  oauth: Procore.HttpClient.OAuth

import_config "#{Mix.env()}.exs"
