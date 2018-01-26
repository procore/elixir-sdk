use Mix.Config

config :procore,
  http_client: HttpClient,
  oauth: HttpClient.OAuth,
  host: "https://api.procore.com"

import_config "#{Mix.env()}.exs"
