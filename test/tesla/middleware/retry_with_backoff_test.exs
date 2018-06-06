defmodule Tesla.Middleware.RetryWithBackoffTest do
  use ExUnit.Case

  defmodule RetryTestAdapter do
    def start_link, do: Agent.start_link(fn -> 0 end, name: __MODULE__)

    def call(env, _opts) do
      Agent.get_and_update(__MODULE__, fn retries ->
        response =
          case env.url do
            "/success" -> {:ok, Map.put(env, :status, 200)}
            "/404" -> {:ok, Map.put(env, :status, 404)}
            "/retry" when retries < 2 -> {:error, :econnrefused}
            "/retry" -> {:ok, Map.put(env, :status, 200)}
            "/retry_fail" -> {:ok, Map.put(env, :status, 504)}
          end

        {response, retries + 1}
      end)
    end
  end

  defmodule RetryTestClient do
    use Tesla
    adapter Tesla.Adapter.Hackney, recv_timeout: 30_000

    plug(Tesla.Middleware.HandleResponse)
    plug(Tesla.Middleware.RetryWithBackoff, delay: 10, max_retries: 3)

    adapter(RetryTestAdapter)
  end

  setup do
    {:ok, _} = RetryTestAdapter.start_link()
    :ok
  end

  test "no retry when successful" do
    assert %Procore.ResponseResult{reply: :ok, status_code: 200} = RetryTestClient.get("/success")
  end

  test "no retry when 4**" do
    assert %Procore.ResponseResult{reply: :unrecognized_code, status_code: 404} =
             RetryTestClient.get("/404")
  end

  test "will retry and pass eventually" do
    assert %Procore.ResponseResult{reply: :ok, status_code: 200} = RetryTestClient.get("/retry")
  end

  test "will retry and fail eventually" do
    assert %Procore.ErrorResult{reply: :error, reason: :gateway_timeout} =
             RetryTestClient.get("/retry_fail")
  end
end
