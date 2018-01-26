defmodule Procore.RequestTest do
  use ExUnit.Case

  alias Procore.Request

  test "insert_request_type/2" do
    assert %Request{request_type: :get} = Request.insert_request_type(%Request{}, :get)
  end

  test "insert_endpoint/2" do
    assert %Request{endpoint: "/api/endpoint"} =
             Request.insert_endpoint(%Request{}, "/api/endpoint")
  end

  test "insert_query_params/2" do
    assert %Request{query_params: %{"query" => "param"}} =
             Request.insert_query_params(%Request{}, %{"query" => "param"})
  end

  test "put_query_body/2" do
    assert %Request{body: %{"body" => "data"}} =
             Request.insert_body(%Request{}, %{"body" => "data"})
  end
end
