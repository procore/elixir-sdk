defmodule Tesla.Middleware.RetryWithBackoff do
  @behaviour Tesla.Middleware

  @defaults [
    delay: 500,
    max_retries: 5
  ]

  alias Tesla.Middleware.Logger.Formatter
  require Logger

  def call(env, next, opts \\ []) do
    delay = Keyword.get(opts, :delay, @defaults[:delay])
    max_retries = Keyword.get(opts, :max_retries, @defaults[:max_retries])

    retry(env, next, delay, max_retries, max_retries)
  end

  defp retry(env, next, _delay, retries, _max_retries) when retries <= 1 do
    Tesla.run(env, next)
  end

  defp retry(env, next, delay, retries, max_retries) do
    case Tesla.run(env, next) do
      {:error, reason} ->
        retry_logging(env, "error: #{reason}", retries)

        backoff_and_retry(delay, retries, max_retries, env, next)

      {:ok, %Tesla.Env{status: 504}} ->
        retry_logging(env, "504 gateway_timeout", retries)

        backoff_and_retry(delay, retries, max_retries, env, next)

      {:ok, env} ->
        {:ok, env}
    end
  end

  defp backoff_and_retry(delay, retries, max_retries, env, next) do
    :math.pow(delay, max_retries - retries)
    |> trunc()
    |> Process.sleep()

    retry(env, next, delay, retries - 1, max_retries)
  end

  defp retry_logging(env, message, retries) do
    Logger.log(:warn, fn -> Formatter.format(env, "", 0, [build_message(message, retries)]) end)
  end

  defp build_message(message, retries) do
    "Retying Due To -> #{message}\n#{retries - 1} Retries Left"
  end
end
