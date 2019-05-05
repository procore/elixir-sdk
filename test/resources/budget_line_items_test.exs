defmodule Procore.Resources.BudgetLineItemsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.BudgetLineItems

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             BudgetLineItems.find(client, params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             BudgetLineItems.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{
      "project_id" => 1,
      "budget_line_item" => %{
        "cost_code_id" => 1,
        "direct_costs" => 10,
        "line_item_type_id" => 1,
        "original_budget_amount" => 100
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             BudgetLineItems.create(client, params)
  end

  test "update/1" do
    client = Procore.client()
    params = %{
      "project_id" => 1,
      "budget_line_item" => %{
        "id" => 1,
        "cost_code_id" => 1,
        "direct_costs" => 10,
        "line_item_type_id" => 1,
        "original_budget_amount" => 100
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             BudgetLineItems.create(client, params)
  end
end
