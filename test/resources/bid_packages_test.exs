defmodule Procore.BidPackagesTest do
  use ExUnit.Case
  alias Procore.Resources.BidPackages

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             BidPackages.list(params)
  end
end
