defmodule Procore.Resources.CompanyChecklistTemplatesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.CompanyChecklistTemplates

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CompanyChecklistTemplates.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CompanyChecklistTemplates.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CompanyChecklistTemplates.list(client, params)
  end

  test "find/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "list_template_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             CompanyChecklistTemplates.find(client, params)
  end

  test "find/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "list_template_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             CompanyChecklistTemplates.find(client, params)
  end

  test "find/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "list_template_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             CompanyChecklistTemplates.find(client, params)
  end

  test "create/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "list_template" => %{}, "attachments" => []}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             CompanyChecklistTemplates.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()

    params = %{
      "company_id" => 1,
      "list_template" => %{},
      "attachments" => [],
      "api_version" => "v1.1"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             CompanyChecklistTemplates.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()

    params = %{
      "company_id" => 1,
      "list_template" => %{},
      "attachments" => [],
      "api_version" => "vapid"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             CompanyChecklistTemplates.create(client, params)
  end
end
