defmodule Tesla.Middleware.ClientCredentialsOAuth do
  @behaviour Tesla.Middleware
  use Tesla, only: [:post]

  adapter(
    Tesla.Adapter.Hackney,
    Application.get_env(:procore, :http_client_adapter_options, recv_timeout: 30_000)
  )

  def call(env, next, client_id: client_id, client_secret: client_secret, host: host) do
    env
    |> add_auth_header(client_id: client_id, client_secret: client_secret, host: host)
    |> Tesla.run(next)
  end

  defp add_auth_header(env, client_id: client_id, client_secret: client_secret, host: host) do
    token = get_access_token(client_id, client_secret, host)

    %{env | headers: [{"Authorization", "Bearer #{token}"} | env.headers]}
  end

  defp get_access_token(client_id, client_secret, host) do
    cache_key = "access_token/#{host}"

    case Cachex.get(:token_cache, cache_key) do
      {:ok, nil} ->
        %{"access_token" => token, "expires_in" => expires_in} =
          post!(tesla_client(), oauth_url(host), oauth_request_body(client_id, client_secret)).body
          |> Jason.decode!()

        Cachex.put(:token_cache, cache_key, token, ttl: :timer.seconds(expires_in - 1000))
        token

      {:ok, token} ->
        token
    end
  end

  def tesla_client do
    Tesla.build_client([
      {Tesla.Middleware.Headers, headers()},
      {Tesla.Middleware.EncodeJson, [engine: Jason]}
    ])
  end

  def headers do
    [{"Content-type", "application/json"}, {"Accept", "application/json"}]
  end

  def oauth_url(host) do
    host <> "/oauth/token"
  end

  def oauth_request_body(client_id, client_secret) do
    %{client_id: client_id, client_secret: client_secret, grant_type: "client_credentials"}
  end
end
