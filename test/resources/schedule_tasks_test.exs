defmodule Procore.Resources.ScheduleTasksTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ScheduleTasks

  test "create/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "task" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ScheduleTasks.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "task" => %{}, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ScheduleTasks.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "task" => %{}, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ScheduleTasks.create(client, params)
  end
end
