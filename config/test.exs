use Mix.Config

config :procore,
  http_client: HttpClient.MockClient,
  oauth: HttpClient.MockOAuth,
  host: "https://test.procore.com"
