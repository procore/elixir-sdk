defmodule Procore.Resources.HazardsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Hazards

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Hazards.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Hazards.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Hazards.list(client, params)
  end

  test "find/1 with default API version" do
    client = Procore.client()
    params = %{"hazard_id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Hazards.find(client, params)
  end

  test "find/1 with specified rest API version" do
    client = Procore.client()
    params = %{"hazard_id" => 1, "company_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Hazards.find(client, params)
  end

  test "find/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"hazard_id" => 1, "company_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Hazards.find(client, params)
  end

  test "create/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "hazard" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Hazards.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "hazard" => %{}, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Hazards.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "hazard" => %{}, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Hazards.create(client, params)
  end
end
