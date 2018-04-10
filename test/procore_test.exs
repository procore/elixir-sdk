defmodule ProcoreTest do
  use ExUnit.Case
  doctest Procore

  alias Procore.Request

  test ":unset request_type on send_request/1" do
    assert_raise ArgumentError, fn ->
      Procore.send_request(%Request{
        request_type: :unset,
        endpoint: "/vapid/endpoint"
      })
    end
  end

  test "empty endpoint on send_request/1" do
    assert_raise ArgumentError, fn ->
      Procore.send_request(%Request{
        request_type: :get,
        endpoint: ""
      })
    end
  end
end
