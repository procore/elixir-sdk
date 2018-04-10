defmodule Procore.Resources.ProjectChecklistsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ProjectChecklists

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ProjectChecklists.list(params)
  end

  test "find/1" do
    params = %{"project_id" => 1, "checklist_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectChecklists.find(params)
  end

  test "create/1" do
    params = %{"project_id" => 1, "template_id" => 1, "list" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ProjectChecklists.create(params)
  end
end
