defmodule Procore.HttpClient.OAuth do
  @doc """
  Hits OAuth endpoint and returns a token.

  Currently, options such as url, id, secret are set
  using env variables in config.exs
  """

  use Tesla
  plug(Tesla.Middleware.EncodeJson)

  @url Application.get_env(:procore, :oauth_url, "https://api.procore.com/oauth/token")
  @id Application.get_env(:procore, :client_id)
  @secret Application.get_env(:procore, :client_secret)

  @spec get_oauth_token() :: binary()
  def get_oauth_token() do
    cache_key = "OAUTH:#{@url}:#{@id}:#{@secret}"

    case Cachex.get(:a, cache_key) do
      {:ok, oauth_token} ->
        oauth_token

      {:missing, _} ->
        case post(tesla_client(), @url, auth_body()) do
          {:ok, %Tesla.Env{status: 200, body: body}} ->
            cache_and_return_token(body, cache_key)

          {:ok, %Tesla.Env{status: 404}} ->
            IO.puts("Not found :(")

          {:ok, %Tesla.Env{status: 401}} ->
            IO.puts("Bad Credentials")

          {:error, reason} ->
            IO.inspect(reason)
        end
    end
  end

  defp auth_body do
    %{client_id: @id, client_secret: @secret, grant_type: "client_credentials"}
  end

  defp cache_and_return_token(body, cache_key) do
    %{"access_token" => token, "expires_in" => expires_in} = Poison.decode!(body)
    Cachex.set(:a, cache_key, token, ttl: :timer.seconds(expires_in - 1000))
    token
  end

  defp tesla_client do
    Tesla.build_client([{Tesla.Middleware.Headers, headers()}])
  end

  defp headers do
    [{"Content-Type", "application/json"}]
  end
end
