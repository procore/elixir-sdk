defmodule Procore.HttpClient.OAuth do
  @doc """
  Hits OAuth endpoint and returns a token.

  Currently, options such as url, id, secret are set
  using env variables in config.exs

  ## Examples
  iex> get_oauth_token()
  "asldkfjdasofiujao324qf832jsakasdlfkjafldsalf"
  """
  @spec get_oauth_token() :: binary()
  def get_oauth_token() do
    url = Application.fetch_env!(:http_client, :oauth_url)
    id = Application.fetch_env!(:http_client, :client_id)
    secret = Application.fetch_env!(:http_client, :client_secret)

    get_oauth_token(url, id, secret)
  end

  defp get_oauth_token(url, id, secret) do
    cache_key = "OAUTH:#{url}:#{id}:#{secret}"

    case Cachex.get(:a, cache_key) do
      {:ok, oauth_oken} ->
        oauth_oken

      {:missing, _} ->
        {body, headers} = oauth_body_headers(id, secret)

        case HTTPoison.post(url, body, headers, []) do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            cache_and_return_token(body, cache_key)

          {:ok, %HTTPoison.Response{status_code: 404}} ->
            IO.puts("Not found :(")

          {:error, %HTTPoison.Error{reason: reason}} ->
            IO.inspect(reason)
        end
    end
  end

  defp oauth_body_headers(id, secret) do
    body =
      Poison.encode!(%{
        client_id: id,
        client_secret: secret,
        grant_type: "client_credentials"
      })

    headers = [{"Content-type", "application/json"}]

    {body, headers}
  end

  defp cache_and_return_token(body, cache_key) do
    %{"access_token" => token, "expires_in" => expires_in} = Poison.decode!(body)
    Cachex.set(:a, cache_key, token, ttl: :timer.seconds(expires_in - 1000))
    token
  end
end
