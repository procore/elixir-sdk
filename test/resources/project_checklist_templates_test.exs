defmodule Procore.Resources.ProjectChecklistTemplatesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ProjectChecklistTemplates

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ProjectChecklistTemplates.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ProjectChecklistTemplates.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ProjectChecklistTemplates.list(client, params)
  end

  test "find/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "list_template_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectChecklistTemplates.find(client, params)
  end

  test "find/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "list_template_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectChecklistTemplates.find(client, params)
  end

  test "find/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "list_template_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectChecklistTemplates.find(client, params)
  end

  test "create_from_company_template/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "source_template_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ProjectChecklistTemplates.create_from_company_template(client, params)
  end

  test "create_from_company_template/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "source_template_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ProjectChecklistTemplates.create_from_company_template(client, params)
  end

  test "create_from_company_template/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "source_template_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ProjectChecklistTemplates.create_from_company_template(client, params)
  end
end
