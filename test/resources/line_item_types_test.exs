defmodule Procore.Resources.LineItemTypesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.LineItemTypes

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             LineItemTypes.find(client, params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             LineItemTypes.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{
      "project_id" => 1,
      "line_item_type" => %{
        "name" => "Labor Burden",
        "csv_import_code" => "LB",
        "base_type" => "materials",
        "origin_data" => "OD-2398273424",
        "origin_id" => "ABC123"
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             LineItemTypes.create(client, params)
  end

  test "update/1" do
    client = Procore.client()
    params = %{
      "project_id" => 1,
      "line_item_type" => %{
        "name" => "Labor Burden",
        "csv_import_code" => "LB",
        "base_type" => "materials",
        "origin_data" => "OD-2398273424",
        "origin_id" => "ABC123"
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             LineItemTypes.create(client, params)
  end
end
