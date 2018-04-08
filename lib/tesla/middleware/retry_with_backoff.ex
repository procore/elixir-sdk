defmodule Tesla.Middleware.RetryWithBackoff do
  @defaults [
    delay: 500,
    max_retries: 5
  ]

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
        IO.inspect("RETRYING DUE TO: #{reason}")
        backoff(delay, retries, max_retries)

        retry(env, next, delay, retries - 1, max_retries)

      {:ok, %Tesla.Env{status: 504}} ->
        IO.inspect("RETRYING DUE TO: 504 Gateway Timeout")
        backoff(delay, retries, max_retries)

        retry(env, next, delay, retries - 1, max_retries)

      {:ok, env} ->
        {:ok, env}
    end
  end

  defp backoff(delay, retries, max_retries) do
    :math.pow(delay, max_retries - retries)
    |> trunc()
    |> :timer.sleep()
  end
end
