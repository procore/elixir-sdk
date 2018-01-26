defmodule ProcoreTest do
  use ExUnit.Case
  doctest Procore

  alias Procore.Request

  test "making a GET request" do
    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Procore.make_request(%Request{
               request_type: :get,
               endpoint: "/vapid/endpoint"
             })
  end

  test "making a POST request" do
    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Procore.make_request(%Request{
               request_type: :post,
               endpoint: "/vapid/endpoint"
             })
  end

  test ":unset request_type on make_request/1" do
    assert_raise ArgumentError, fn ->
      Procore.make_request(%Request{
        request_type: :unset,
        endpoint: "/vapid/endpoint"
      })
    end
  end

  test "empty endpoint on make_request/1" do
    assert_raise ArgumentError, fn ->
      Procore.make_request(%Request{
        request_type: :get,
        endpoint: ""
      })
    end
  end
end
