defmodule Procore do
  @moduledoc """
  Makes requests using the HttpClient.
  """

  alias Procore.ErrorResult
  alias Procore.HttpClient.QueryParams
  alias Procore.Request
  alias Procore.ResponseResult

  @http_client Application.get_env(:procore, :http_client, HttpClient.MockClient)
  @oauth Application.get_env(:procore, :oauth, HttpClient.MockOAuth)
  @host Application.get_env(:procore, :host, "https://api.procore.com")

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

  @spec make_request(Request.t()) :: %ResponseResult{} | %ErrorResult{} | ArgumentError

  @doc """
  Makes a GET request.
  """
  def make_request(%Request{request_type: :get, endpoint: endpoint, query_params: query_params})
      when byte_size(endpoint) > 0 do
    @http_client.get(
      "#{@host}#{endpoint}",
      headers(),
      QueryParams.build(query_params)
    )
  end

  @doc """
  Makes a POST request.
  """
  def make_request(%Request{request_type: :post, endpoint: endpoint, body: body})
      when byte_size(endpoint) > 0 do
    @http_client.post("#{@host}#{endpoint}", body, headers())
  end

  @doc """
  Raises an error if no request type is set.
  """
  def make_request(%Request{request_type: :unset}) do
    raise ArgumentError, "you must set a request_type for the Procore.Request struct"
  end

  @doc """
  Raises an error if no endpoint is set.
  """
  def make_request(%Request{endpoint: ""}) do
    raise ArgumentError, "you must set an endpoint for the Procore.Request struct"
  end

  defp headers do
    [{"Content-Type", "application/json"}, {"Authorization", "Bearer #{token()}"}]
  end

  defp token do
    @oauth.get_oauth_token()
  end
end
