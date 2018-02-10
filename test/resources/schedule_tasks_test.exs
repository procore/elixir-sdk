defmodule Procore.Resources.ScheduleTasksTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ScheduleTasks

  test "create/1" do
    params = %{"project_id" => 1, "task" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ScheduleTasks.create(params)
  end
end
