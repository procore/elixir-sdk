defmodule Procore.Resources.WorkOrderContractsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.WorkOrderContracts

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             WorkOrderContracts.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             WorkOrderContracts.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             WorkOrderContracts.list(client, params)
  end

  test "find/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "work_order_contract_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             WorkOrderContracts.find(client, params)
  end

  test "find/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "work_order_contract_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             WorkOrderContracts.find(client, params)
  end

  test "find/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "work_order_contract_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             WorkOrderContracts.find(client, params)
  end

  test "sync/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "work_order_contracts" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             WorkOrderContracts.sync(client, params)
  end

  test "sync/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "work_order_contracts" => [], "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             WorkOrderContracts.sync(client, params)
  end

  test "sync/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "work_order_contracts" => [], "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             WorkOrderContracts.sync(client, params)
  end
end
