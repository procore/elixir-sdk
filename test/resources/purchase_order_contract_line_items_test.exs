defmodule Procore.Resources.PurchaseOrderContractLineItemsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.PurchaseOrderContractLineItems

  test "list/1" do
    params = %{"project_id" => 1, "purchase_order_contract_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             PurchaseOrderContractLineItems.list(params)
  end

  test "create/1" do
    params = %{"project_id" => 1, "purchase_order_contract_id" => 1, "line_item" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             PurchaseOrderContractLineItems.create(params)
  end
end
