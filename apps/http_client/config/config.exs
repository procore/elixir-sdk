# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :http_client, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:http_client, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#

config :http_client,
  client_id: "b55aad4a24503c4c9cdc840aa21d5015c188c7600e77b3f0d82d113d4914c196",
  client_secret: "f3f5ec7159622e7103b2f305ee8ef013d9641da79f0082c98630cec1d21f24a5",
  oauth_url: "https://staging13.procoretech-qa.com/oauth/token"

import_config "#{Mix.env()}.exs"
