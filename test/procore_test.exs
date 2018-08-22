defmodule ProcoreTest do
  use ExUnit.Case
  doctest Procore

  alias Procore.Request
  alias Tesla.Middleware.AuthorizationOAuth
  alias Tesla.Middleware.ClientCredentialsOAuth

  setup do
    on_exit(fn ->
      Application.put_env(:procore, :oauth_client, ClientCredentialsOAuth)
    end)
  end

  test ":unset request_type on send_request/1" do
    assert_raise ArgumentError, fn ->
      Procore.send_request(%Request{
        request_type: :unset,
        endpoint: "/vapid/endpoint"
      })
    end
  end

  test "empty endpoint on send_request/1" do
    assert_raise ArgumentError, fn ->
      Procore.send_request(%Request{
        request_type: :get,
        endpoint: ""
      })
    end
  end

  describe "client/2" do
    test "creates a client credentials client without any options" do
      client_id_config = "client-id"
      client_secret_config = "client-secret"

      Application.put_env(:procore, :oauth_client, ClientCredentialsOAuth)
      Application.put_env(:procore, :client_id, client_id_config)
      Application.put_env(:procore, :client_secret, client_secret_config)

      %Tesla.Client{pre: middleware} = Procore.client()

      {_, _, [[client_id: client_id, client_secret: client_secret, host: _]]} =
        List.keyfind(middleware, ClientCredentialsOAuth, 0)

      assert(client_id == client_id_config)
      assert(client_secret == client_secret_config)
    end

    test "creates a client credentials client with client_id/client_secret" do
      client_id_config = "client-id"
      client_secret_config = "client-secret"

      Application.put_env(:procore, :oauth_client, ClientCredentialsOAuth)

      %Tesla.Client{pre: middleware} =
        Procore.client(client_id: client_id_config, client_secret: client_secret_config)

      {_, _, [[client_id: client_id, client_secret: client_secret, host: _]]} =
        List.keyfind(middleware, ClientCredentialsOAuth, 0)

      assert(client_id == client_id_config)
      assert(client_secret == client_secret_config)
    end

    test "creates a authorization client with token" do
      token = fn -> "token" end

      Application.put_env(:procore, :oauth_client, AuthorizationOAuth)

      %Tesla.Client{pre: middleware} = Procore.client(token: token)

      {_, _, [[token: actual_token]]} = List.keyfind(middleware, AuthorizationOAuth, 0)

      assert(token == actual_token)
    end
  end
end
