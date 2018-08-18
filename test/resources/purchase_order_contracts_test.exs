defmodule Procore.Resources.PurchaseOrderContractsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.PurchaseOrderContracts

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             PurchaseOrderContracts.list(client, params)
  end

  test "find/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "purchase_order_contract_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PurchaseOrderContracts.find(client, params)
  end

  test "sync/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "purchase_order_contracts" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PurchaseOrderContracts.sync(params)
  end
end
