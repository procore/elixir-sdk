defmodule Procore.BidPackagesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.BidPackages

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             BidPackages.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "bid_package" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             BidPackages.create(client, params)
  end
end
