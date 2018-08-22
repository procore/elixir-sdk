use Mix.Config

config :tesla, :adapter, Tesla.Adapter.Hackney

import_config "#{Mix.env()}.exs"
