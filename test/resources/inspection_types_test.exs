defmodule Procore.Resources.InspectionTypesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.InspectionTypes

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             InspectionTypes.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "inspection_type" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             InspectionTypes.create(client, params)
  end
end
