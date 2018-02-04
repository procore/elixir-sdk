defmodule Procore.Resources.VendorsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Vendors

  test "list/1" do
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} = Vendors.list(params)
  end

  test "add_vendor_to_project/1" do
    params = %{"project_id" => 1, "vendor_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Vendors.add_vendor_to_project(params)
  end

  test "bulk_create/1" do
    params = %{"company_id" => 1, "vendors" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Vendors.bulk_create(params)
  end
end
