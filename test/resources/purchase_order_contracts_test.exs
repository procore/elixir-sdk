defmodule Procore.Resources.PurchaseOrderContractsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.PurchaseOrderContracts

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             PurchaseOrderContracts.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             PurchaseOrderContracts.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             PurchaseOrderContracts.list(client, params)
  end

  test "find/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "purchase_order_contract_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PurchaseOrderContracts.find(client, params)
  end

  test "find/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "purchase_order_contract_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PurchaseOrderContracts.find(client, params)
  end

  test "find/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "purchase_order_contract_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PurchaseOrderContracts.find(client, params)
  end

  test "sync/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "purchase_order_contracts" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PurchaseOrderContracts.sync(client, params)
  end

  test "sync/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "purchase_order_contracts" => [], "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PurchaseOrderContracts.sync(client, params)
  end

  test "sync/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "purchase_order_contracts" => [], "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PurchaseOrderContracts.sync(client, params)
  end
end
