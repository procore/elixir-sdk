defmodule Procore.HttpClient do
  use Retry

  alias Procore.ResponseResult
  alias Procore.ErrorResult

  @moduledoc false
  @default_options [recv_timeout: :infinity]

  @spec get(String.t(), list, Keyword.t()) :: %ResponseResult{} | %ErrorResult{}
  def get(url, headers, options) do
    IO.puts("GET:")
    IO.inspect(url)
    IO.inspect(options)
    retry with: exp_backoff() |> randomize() |> expiry(150_000), rescue_only: [TimeoutError] do
      HTTPoison.get(url, headers, build_options(options)) |>
        handle_response()
    end
  end

  @spec post_multipart(String.t(), tuple, list, Keyword.t()) :: %ResponseResult{} | %ErrorResult{}
  def post_multipart(url, body, headers, options \\ []) when is_tuple(body) do
    IO.puts("POST MULTI:")
    IO.inspect(url)
    IO.inspect(body)

    retry with: exp_backoff() |> randomize() |> expiry(150_000), rescue_only: [TimeoutError] do
      HTTPoison.post(url, body, headers, build_options(options)) |>
        handle_response()
    end
  end

  @spec post(String.t(), map, list, Keyword.t()) :: %ResponseResult{} | %ErrorResult{}
  def post(url, body, headers, options \\ []) when is_map(body) do
    IO.puts("POST:")
    IO.inspect(url)
    IO.inspect(body)

    retry with: exp_backoff() |> randomize() |> expiry(150_000), rescue_only: [TimeoutError] do
      HTTPoison.post(url, to_json(body), headers, build_options(options)) |>
        handle_response()
    end
  end

  @spec patch(String.t(), map, list, Keyword.t()) :: %ResponseResult{} | %ErrorResult{}
  def patch(url, body, headers, options \\ []) do
    IO.puts("PATCH:")
    IO.inspect(url)
    IO.inspect(body)

    retry with: exp_backoff() |> randomize() |> expiry(150_000), rescue_only: [TimeoutError] do
      HTTPoison.patch(url, to_json(body), headers, build_options(options)) |>
        handle_response()
    end
  end

  defp build_options(options) when is_list(options) do
    [options | @default_options] |> List.flatten()
  end

  defp to_json(body) do
    Poison.encode!(body)
  end

  defp parse_body(body, headers) do
    IO.inspect("RESPONSE BODY #######################")
    IO.inspect(body)
    IO.inspect("end RESPONSE BODY #######################")

    if List.keymember?(headers, "application/json", 1),
      do: ResponseResult.parse_json_body(body),
      else: body
  end

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    {:ok, {%{}, opts}}
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  defp handle_response(res) do
    IO.inspect(res)

    case res do
      {:ok, %HTTPoison.Response{status_code: 200, body: body, headers: headers}} ->
        %ResponseResult{reply: :ok, status_code: 200, parsed_body: parse_body(body, headers)}

      {:ok, %HTTPoison.Response{status_code: 201, body: body, headers: headers}} ->
        %ResponseResult{reply: :ok, status_code: 201, parsed_body: parse_body(body, headers)}

      # TODO handle 500 error, which often returns html and then later breaks dependent sequence tasks.
      {:ok, %HTTPoison.Response{status_code: 500, body: body, headers: headers}} ->
        IO.inspect("Got a 500 - raising TimeoutError and retrying")
        raise TimeoutError

      {:ok, %HTTPoison.Response{status_code: 504, body: body, headers: headers}} ->
        IO.inspect("Got a 504 - raising TimeoutError and retrying")
        raise TimeoutError

      {:ok, %HTTPoison.Response{status_code: code, body: body, headers: headers}} ->
        %ResponseResult{
          reply: :unrecognized_code,
          status_code: code,
          parsed_body: parse_body(body, headers)
        }

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect("ERROR OF REASON #{reason}")
        %ErrorResult{reply: :error, reason: reason}
    end
  end
end
