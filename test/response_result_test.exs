defmodule Procore.ResponseResultTest do
  use ExUnit.Case

  alias Procore.ResponseResult

  test "parse_json_body/1" do
    json_string = "{\"key\": \"value\"}"
    assert ResponseResult.parse_json_body(json_string) == %{"key" => "value"}
  end

  test "only accetps json string response body" do
    map_string = "%{\"value\" => \"key\"}"
    assert_raise Poison.SyntaxError, fn -> ResponseResult.parse_json_body(map_string) end
  end
end
