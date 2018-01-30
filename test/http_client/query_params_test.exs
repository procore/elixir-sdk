defmodule Procore.HttpClient.QueryParamsTest do
  use ExUnit.Case
  alias Procore.HttpClient.QueryParams

  test "converts query params from map to tuples" do
    params = %{"key1" => 1, "key2" => 2}

    assert [params: [{"key1", 1}, {"key2", 2}]] = QueryParams.build(params)
  end
end
