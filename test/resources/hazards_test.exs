defmodule Procore.Resources.HazardsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Hazards

  test "list/1" do
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Hazards.list(params)
  end

  test "find/1" do
    params = %{"hazard_id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Hazards.find(params)
  end

  test "create/1" do
    params = %{"company_id" => 1, "hazard" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Hazards.create(params)
  end
end
