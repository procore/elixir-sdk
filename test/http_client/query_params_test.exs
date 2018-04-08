defmodule Procore.HttpClient.QueryParamsTest do
  use ExUnit.Case
  alias Procore.HttpClient.QueryParams

  test "converts query params from map to keywords" do
    params = %{"key1" => 1, "key2" => 2}

    assert [query: [key1: 1, key2: 2]] == QueryParams.build(params)
  end
end
