defmodule Procore.Resources.CompanyChecklistTemplateSectionsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.CompanyChecklistTemplateSections

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "list_template_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CompanyChecklistTemplateSections.list(client, params)
  end

  test "find/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "section_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             CompanyChecklistTemplateSections.find(client, params)
  end

  test "bulk_create/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "list_template_id" => 1, "sections" => []}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: []} =
             CompanyChecklistTemplateSections.bulk_create(client, params)
  end
end
