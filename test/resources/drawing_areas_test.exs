defmodule Procore.Resources.DrawingAreasTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.DrawingAreas

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             DrawingAreas.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             DrawingAreas.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             DrawingAreas.list(client, params)
  end

  test "create/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "name" => "Area A"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             DrawingAreas.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "name" => "Area A", "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             DrawingAreas.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "name" => "Area A", "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             DrawingAreas.create(client, params)
  end
end
