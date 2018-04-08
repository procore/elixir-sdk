defmodule Tesla.Middleware.HandleResponse do
  alias Procore.ResponseResult

  def call(env, next, _options) do
    env
    |> Tesla.run(next)
    |> handle_response()
  end

  defp handle_response(response) do
    IO.inspect(response)

    case response do
      {:ok, %Tesla.Env{status: 200, body: body, headers: headers}} ->
        %ResponseResult{reply: :ok, status_code: 200, parsed_body: parse_body(body, headers)}

      {:ok, %Tesla.Env{status: 201, body: body, headers: headers}} ->
        %ResponseResult{reply: :ok, status_code: 201, parsed_body: parse_body(body, headers)}

      {:ok, %Tesla.Env{status: 202, body: body, headers: headers}} ->
        %ResponseResult{reply: :ok, status_code: 202, parsed_body: parse_body(body, headers)}

      {:ok, %Tesla.Env{status: 504}} ->
        IO.inspect("Got a 504 - error and retry")
        {:error, :gateway_timeout}

      {:ok, %Tesla.Env{status: code, body: body, headers: headers}} ->
        %ResponseResult{
          reply: :unrecognized_code,
          status_code: code,
          parsed_body: parse_body(body, headers)
        }

      {:error, reason} ->
        IO.inspect("ERROR: #{reason}")
        {:error, reason}
    end
  end

  defp parse_body(body, headers) do
    IO.inspect("RESPONSE BODY #######################")
    IO.inspect(body)
    IO.inspect("END RESPONSE BODY #######################")

    if List.keymember?(headers, "application/json", 1),
      do: ResponseResult.parse_json_body(body),
      else: body
  end
end
