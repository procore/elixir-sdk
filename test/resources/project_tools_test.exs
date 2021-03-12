defmodule Procore.Resources.ProjectToolsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ProjectTools

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ProjectTools.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ProjectTools.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ProjectTools.list(client, params)
  end

  test "update/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "project_tools" => []}

    ProjectTools.update(client, params)

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectTools.update(client, params)
  end

  test "update/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "project_tools" => [], "api_version" => "v1.1"}

    ProjectTools.update(client, params)

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectTools.update(client, params)
  end

  test "update/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "project_tools" => [], "api_version" => "vapid"}

    ProjectTools.update(client, params)

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectTools.update(client, params)
  end
end
