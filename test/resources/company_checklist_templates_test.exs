defmodule Procore.Resources.CompanyChecklistTemplatesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.CompanyChecklistTemplates

  test "list/1" do
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CompanyChecklistTemplates.list(params)
  end

  test "find/1" do
    params = %{"company_id" => 1, "list_template_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             CompanyChecklistTemplates.find(params)
  end

  test "create/1" do
    params = %{"company_id" => 1, "list_template" => %{}, "attachments" => []}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             CompanyChecklistTemplates.create(params)
  end
end
