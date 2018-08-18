defmodule Procore.Resources.WorkOrderContractLineItemsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.WorkOrderContractLineItems

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "work_order_contract_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             WorkOrderContractLineItems.list(params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "work_order_contract_id" => 1, "line_item" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             WorkOrderContractLineItems.create(params)
  end
end
