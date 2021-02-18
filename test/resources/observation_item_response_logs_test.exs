defmodule Procore.Resources.ObservationItemResponseLogsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ObservationItemResponseLogs

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "observation_item_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ObservationItemResponseLogs.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "observation_item_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ObservationItemResponseLogs.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "observation_item_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ObservationItemResponseLogs.list(client, params)
  end

  test "create/1 with default API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "reponse_log" => %{},
      "status" => "initiated",
      "attachments" => [],
      "observation_item_id" => 1
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ObservationItemResponseLogs.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "reponse_log" => %{},
      "status" => "initiated",
      "attachments" => [],
      "observation_item_id" => 1,
      "api_version" => "v1.1"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ObservationItemResponseLogs.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "reponse_log" => %{},
      "status" => "initiated",
      "attachments" => [],
      "observation_item_id" => 1,
      "api_version" => "vapid"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ObservationItemResponseLogs.create(client, params)
  end
end
