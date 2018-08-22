defmodule Procore.Resources.ProjectChecklistsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ProjectChecklists

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ProjectChecklists.list(client, params)
  end

  test "find/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "checklist_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectChecklists.find(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "template_id" => 1, "list" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ProjectChecklists.create(client, params)
  end
end
