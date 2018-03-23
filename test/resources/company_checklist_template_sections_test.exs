defmodule Procore.Resources.CompanyChecklistTemplateSectionsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.CompanyChecklistTemplateSections

  test "list/1" do
    params = %{"company_id" => 1, "list_template_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CompanyChecklistTemplateSections.list(params)
  end

  test "show/1" do
    params = %{"company_id" => 1, "section_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             CompanyChecklistTemplateSections.show(params)
  end

  test "bulk_create/1" do
    params = %{"company_id" => 1, "list_template_id" => 1, "sections" => []}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: []} =
             CompanyChecklistTemplateSections.bulk_create(params)
  end
end
