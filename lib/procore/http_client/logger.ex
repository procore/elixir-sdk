defmodule Procore.HttpClient.Logger do
  require Logger

  alias Procore.ResponseResult
  alias Procore.ErrorResult

  @spec get_request(String.t(), Keyword.t()) :: Keyword.t()
  def get_request(url, options) do
    Logger.info("GET Request -> #{url}")
    Logger.info("Query Params ->")
    Logger.info(inspect(Keyword.get(options, :params)))
  end

  @spec post_multipart_request(String.t(), tuple) :: tuple
  def post_multipart_request(url, body) do
    Logger.info("POST Multiplart Request -> #{url}")
    Logger.info("Body ->")
    Logger.info(inspect(body))
  end

  @spec post_request(String.t(), map) :: map
  def post_request(url, body) do
    Logger.info("POST Request -> #{url}")
    Logger.info("Body ->")
    Logger.info(inspect(body))
  end

  @spec patch_request(String.t(), map) :: map
  def patch_request(url, body) do
    Logger.info("PATCH Request -> #{url}")
    Logger.info("Body ->")
    Logger.info(inspect(body))
  end

  @spec result(ResponseResult.t() | ErrorResult.t()) :: ResponseResult.t() | ErrorResult.t()

  def result(%ResponseResult{} = result) do
    Logger.info("Status Code -> #{result.status_code}")
    Logger.info("Response Body ->")
    Logger.info(inspect(result.parsed_body, printable_limit: :infinity, limit: :infinity))
  end

  def result(%ErrorResult{} = result) do
    Logger.info("Error Reason -> #{result.reason}")
  end

  @spec time_elasped(tuple) :: String.t()
  def time_elasped({_megasecs, _secs, _microsecs} = from) do
    duration =
      :timer.now_diff(from, :erlang.timestamp) / 1000
      |> abs()

    Logger.info("Time Elasped -> #{duration} ms")
  end
end
