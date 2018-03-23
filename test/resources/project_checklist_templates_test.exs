defmodule Procore.Resources.ProjectChecklistTemplatesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ProjectChecklistTemplates

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ProjectChecklistTemplates.list(params)
  end

  test "show/1" do
    params = %{"project_id" => 1, "list_template_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectChecklistTemplates.show(params)
  end
end
