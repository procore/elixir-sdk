defmodule Procore do
  @moduledoc """
  Makes requests using the HttpClient.
  """

  alias Procore.ClientBuilder
  alias Procore.ErrorResult
  alias Procore.HttpClient.QueryParams
  alias Procore.Request
  alias Procore.ResponseResult

  @spec child_spec(list) :: map()
  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 10000
    }
  end

  @spec start_link(Keyword.t()) :: {:ok, pid()} | {:error, {:already_started, pid()}}
  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @spec init(Keyword.t()) :: {:ok, term()}
  def init(opts) do
    {:ok, {%{}, opts}}
  end

  @spec send_request(Request.t()) :: %ResponseResult{} | %ErrorResult{} | ArgumentError

  @doc """
  Builds a Procore client.

  Handles creating a client credentials client with or without client_id and
  client_secret passed in as options.

  Handles creating a authorization client with or without client_id and
  client_secret passed in as options. However a token is always required in options
  for an authorization client.
  """
  def client(opts \\ []) do
    ClientBuilder.build(oauth_client(), opts)
  end

  @doc """
  Makes a GET request.
  """
  def send_request(
        %Request{
          request_type: :get,
          api_version: api_version,
          endpoint: endpoint,
          query_params: query_params
        },
        client
      )
      when byte_size(endpoint) > 0 do
    http_client().get(client, "#{api_version}#{endpoint}", QueryParams.build(query_params))
  end

  @doc """
  Makes a POST request.
  """
  def send_request(
        %Request{
          request_type: :post,
          api_version: api_version,
          endpoint: endpoint,
          body: body,
          query_params: query_params
        },
        client
      )
      when byte_size(endpoint) > 0 do
    http_client().post(client, "#{api_version}#{endpoint}", body, QueryParams.build(query_params))
  end

  @doc """
  Makes a PATCH request.
  """
  def send_request(
        %Request{request_type: :patch, api_version: api_version, endpoint: endpoint, body: body},
        client
      )
      when byte_size(endpoint) > 0 do
    http_client().patch(client, "#{api_version}#{endpoint}", body)
  end

  @doc """
  Raises an error if no request type is set.
  """
  def send_request(%Request{request_type: :unset}) do
    raise ArgumentError, "you must set a request_type for the Procore.Request struct"
  end

  @doc """
  Raises an error if no endpoint is set.
  """
  def send_request(%Request{endpoint: ""}) do
    raise ArgumentError, "you must set an endpoint for the Procore.Request struct"
  end

  defp oauth_client() do
    Application.get_env(
      :procore,
      :oauth_client,
      Tesla.Middleware.ClientCredentialsOAuth
    )
  end

  def http_client() do
    Application.get_env(:procore, :http_client, HttpClient.MockClient)
  end
end
