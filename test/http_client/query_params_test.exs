defmodule Procore.HttpClient.QueryParamsTest do
  use ExUnit.Case
  alias Procore.HttpClient.QueryParams

  test "converts query params from map to keywords" do
    params = %{"non_nested" => 1, "nested" => %{"key3" => 3}}

    assert [query: %{"non_nested" => 1, "nested[key3]" => 3}] == QueryParams.build(params)
  end
end
