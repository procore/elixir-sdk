defmodule Tesla.Middleware.HandleResponse do
  @behaviour Tesla.Middleware

  alias Procore.ResponseResult
  alias Procore.ErrorResult

  def call(env, next, _options) do
    env
    |> Tesla.run(next)
    |> handle_response()
  end

  defp handle_response(response) do
    case response do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        %ResponseResult{reply: :ok, status_code: 200, parsed_body: body}

      {:ok, %Tesla.Env{status: 201, body: body}} ->
        %ResponseResult{reply: :ok, status_code: 201, parsed_body: body}

      {:ok, %Tesla.Env{status: 202, body: body}} ->
        %ResponseResult{reply: :ok, status_code: 202, parsed_body: body}

      {:ok, %Tesla.Env{status: 504}} ->
        %ErrorResult{reply: :error, reason: :gateway_timeout}

      {:ok, %Tesla.Env{status: 503}} ->
        %ErrorResult{reply: :error, reason: :gateway_unavailable}

      {:ok, %Tesla.Env{status: code, body: body}} ->
        %ResponseResult{reply: :unrecognized_code, status_code: code, parsed_body: body}

      {:error, reason} ->
        %ErrorResult{reply: :error, reason: reason}
    end
  end
end
