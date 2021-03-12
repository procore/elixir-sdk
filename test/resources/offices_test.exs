defmodule Procore.Resources.OfficesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Offices

  doctest Procore.Resources.Offices

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Offices.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Offices.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Offices.list(client, params)
  end
end
