use Mix.Config

config :procore,
  http_client: HttpClient,
  oauth: HttpClient.OAuth,
  host: "https://api.procore.com",
  oauth_url: "https://api.procore.com/oauth/token"

import_config "#{Mix.env()}.exs"
