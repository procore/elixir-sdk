defmodule Tesla.Middleware.AuthorizationOAuth do
  @behaviour Tesla.Middleware
  use Tesla, only: [:post]

  adapter(
    Tesla.Adapter.Hackney,
    Application.get_env(:procore, :http_client_adapter_options, recv_timeout: 30_000)
  )

  defp procore_host(), do: Application.get_env(:procore, :host, "https://api.procore.com")
  defp client_id(), do: Application.get_env(:procore, :client_id)
  defp client_secret(), do: Application.get_env(:procore, :client_secret)

  def call(env, next, token: token) do
    env
    |> add_auth_header(token)
    |> Tesla.run(next)
  end

  defp add_auth_header(env, token) do
    %{env | headers: [{"Authorization", "Bearer #{token.()}"} | env.headers]}
  end

  def tesla_client do
    Tesla.build_client([
      {Tesla.Middleware.Headers, headers()},
      {Tesla.Middleware.EncodeJson, [engine: Poison]}
    ])
  end

  def headers do
    [{"Content-type", "application/json"}, {"Accept", "application/json"}]
  end

  def oauth_url do
    procore_host() <> "/oauth/token"
  end

  def oauth_request_body do
    %{client_id: client_id(), client_secret: client_secret(), grant_type: "client_credentials"}
  end
end
