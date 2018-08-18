defmodule Procore.Resources.ObservationItemResponseLogsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ObservationItemResponseLogs

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "observation_item_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ObservationItemResponseLogs.list(client, params)
  end

  test "find/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "observation_item_id" => 1, "id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ObservationItemResponseLogs.find(params)
  end

  test "create/1" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "reponse_log" => %{},
      "status" => "initiated",
      "attachments" => [],
      "observation_item_id" => 1
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ObservationItemResponseLogs.create(params)
  end
end
