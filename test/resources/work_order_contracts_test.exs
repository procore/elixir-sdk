defmodule Procore.Resources.WorkOrderContractsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.WorkOrderContracts

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             WorkOrderContracts.list(params)
  end

  test "show/1" do
    params = %{"project_id" => 1, "work_order_contract_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             WorkOrderContracts.show(params)
  end

  test "sync/1" do
    params = %{"project_id" => 1, "work_order_contracts" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             WorkOrderContracts.sync(params)
  end
end
