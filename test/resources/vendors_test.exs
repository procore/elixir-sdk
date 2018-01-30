defmodule Procore.Resources.VendorsTest do
  use ExUnit.Case
  alias Procore.Resources.Vendors

  test "list/1" do
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} = Vendors.list(params)
  end
end
