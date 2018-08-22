defmodule Procore.Resources.HazardsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Hazards

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Hazards.list(client, params)
  end

  test "find/1" do
    client = Procore.client()
    params = %{"hazard_id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} = Hazards.find(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "hazard" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Hazards.create(client, params)
  end
end
