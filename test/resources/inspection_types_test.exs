defmodule Procore.Resources.InspectionTypesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.InspectionTypes

  test "list/1" do
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             InspectionTypes.list(params)
  end

  test "create/1" do
    params = %{"company_id" => 1, "inspection_type" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             InspectionTypes.create(params)
  end
end
