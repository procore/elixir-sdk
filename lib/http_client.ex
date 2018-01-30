defmodule HttpClient do
  use Retry

  @moduledoc false
  @default_options [recv_timeout: :infinity]

  @spec get(String.t(), list, Keyword.t()) :: %ResponseResult{} | %ErrorResult{}
  def get(url, headers, options) do
    IO.puts("GET:")
    IO.inspect(url)
    IO.inspect(options)

    retry with: exp_backoff() |> randomize() |> expiry(150_000), rescue_only: [TimeoutError] do
      case HTTPoison.get(url, headers, build_options(options)) do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          %ResponseResult{reply: :ok, status_code: 200, parsed_body: parse_body(body)}

        {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
          %ResponseResult{reply: :ok, status_code: 201, parsed_body: parse_body(body)}

        {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
          %ResponseResult{
            reply: :unrecognized_code,
            status_code: code,
            parsed_body: parse_body(body)
          }

        {:error, %HTTPoison.Error{reason: reason}} ->
          %ErrorResult{reply: :error, reason: reason}
      end
    end
  end

  @spec post_multipart(String.t(), tuple, list, Keyword.t()) :: %ResponseResult{} | %ErrorResult{}
  def post_multipart(url, body, headers, options \\ []) when is_tuple(body) do
    IO.puts("POST MULTI:")
    IO.inspect(url)
    IO.inspect(body)

    retry with: exp_backoff() |> randomize() |> expiry(150_000), rescue_only: [TimeoutError] do
      case HTTPoison.post(url, body, headers, build_options(options)) do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          %ResponseResult{reply: :ok, status_code: 200, parsed_body: parse_body(body)}

        {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
          %ResponseResult{reply: :ok, status_code: 201, parsed_body: parse_body(body)}

        {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
          %ResponseResult{
            reply: :unrecognized_code,
            status_code: code,
            parsed_body: parse_body(body)
          }

        {:error, %HTTPoison.Error{reason: reason}} ->
          %ErrorResult{reply: :error, reason: reason}
      end
    end
  end

  @spec post(String.t(), map, list, Keyword.t()) :: %ResponseResult{} | %ErrorResult{}
  def post(url, body, headers, options \\ []) when is_map(body) do
    IO.puts("POST:")
    IO.inspect(url)
    IO.inspect(body)

    retry with: exp_backoff() |> randomize() |> expiry(150_000), rescue_only: [TimeoutError] do
      case HTTPoison.post(url, to_json(body), headers, build_options(options)) do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          %ResponseResult{reply: :ok, status_code: 200, parsed_body: parse_body(body)}

        {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
          %ResponseResult{reply: :ok, status_code: 201, parsed_body: parse_body(body)}

        {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
          %ResponseResult{
            reply: :unrecognized_code,
            status_code: code,
            parsed_body: parse_body(body)
          }

        {:error, %HTTPoison.Error{reason: reason}} ->
          %ErrorResult{reply: :error, reason: reason}
      end
    end
  end

  @spec patch(String.t(), map, list, Keyword.t()) :: %ResponseResult{} | %ErrorResult{}
  def patch(url, body, headers, options \\ []) do
    IO.puts("PATCH:")
    IO.inspect(url)
    IO.inspect(body)

    retry with: exp_backoff() |> randomize() |> expiry(150_000), rescue_only: [TimeoutError] do
      case HTTPoison.patch(url, to_json(body), headers, build_options(options)) do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          %ResponseResult{reply: :ok, status_code: 200, parsed_body: parse_body(body)}

        {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
          %ResponseResult{reply: :ok, status_code: 201, parsed_body: parse_body(body)}

        {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
          %ResponseResult{
            reply: :unrecognized_code,
            status_code: code,
            parsed_body: parse_body(body)
          }

        {:error, %HTTPoison.Error{reason: reason}} ->
          %ErrorResult{reply: :error, reason: reason}
      end
    end
  end

  defp build_options(options) when is_list(options) do
    [options | @default_options] |> List.flatten()
  end

  defp to_json(body) do
    Poison.encode!(body)
  end

  defp parse_body(body) do
    ResponseResult.parse_json_body(body)
  end
end
