use Mix.Config

config :procore,
  http_client: HttpClient.MockClient,
  oauth: HttpClient.MockOAuth,
  # should be the same as mock_client_procore_host in apps/http_client/config/test.exs
  host: "https://test.procore.com"
