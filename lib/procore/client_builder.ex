defmodule Procore.ClientBuilder do
  @moduledoc false

  alias Tesla.Middleware.AuthorizationOauth
  alias Tesla.Middleware.ClientCredentialsOAuth

  def build(ClientCredentialsOAuth, client_id: client_id, client_secret: client_secret) do
    Tesla.build_client([
      {Tesla.Middleware.Headers, headers()},
      {Tesla.Middleware.BaseUrl, host()},
      {ClientCredentialsOAuth,
       [
         client_id: client_id,
         client_secret: client_secret,
         host: host()
       ]}
    ])
  end

  def build(ClientCredentialsOAuth, _opts) do
    Tesla.build_client([
      {Tesla.Middleware.Headers, headers()},
      {Tesla.Middleware.BaseUrl, host()},
      {ClientCredentialsOAuth,
       [
         client_id: credentials_from_config(:client_id),
         client_secret: credentials_from_config(:client_secret),
         host: host()
       ]}
    ])
  end

  def build(AuthorizationOAuth, token: token) when is_function(token) do
    Tesla.build_client([
      {Tesla.Middleware.Headers, headers()},
      {Tesla.Middleware.BaseUrl, host()},
      {AuthorizationOAuth, [token: token]}
    ])
  end

  defp headers do
    # [{"Content-Type", "application/json"}] # works for everything, besides multipart
    # [{"Content-Type", "multipart/form-data"}] # works for multipart
    # seems to work for both
    []
  end

  defp credentials_from_config(key) do
    Application.fetch_env!(:procore, key)
  end

  defp host() do
    Application.get_env(:procore, :host, "https://api.procore.com")
  end
end
