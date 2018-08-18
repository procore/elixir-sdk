defmodule Procore.Resources.VendorsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Vendors

  test "list/1 for a company directory" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Vendors.list(client, params)
  end

  test "list/1 for a project directory" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Vendors.list(client, params)
  end

  test "add_vendor_to_project/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "vendor_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Vendors.add_vendor_to_project(params)
  end

  test "sync/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "vendors" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} = Vendors.sync(params)
  end
end
