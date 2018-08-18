defmodule Procore.Resources.ScheduleResourcesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ScheduleResources

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ScheduleResources.list(params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "resource" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ScheduleResources.create(params)
  end
end
