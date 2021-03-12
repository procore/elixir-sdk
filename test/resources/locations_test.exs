defmodule Procore.Resources.LocationsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Locations

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Locations.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Locations.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Locations.list(client, params)
  end

  test "create/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "location" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Locations.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "location" => %{}, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Locations.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "location" => %{}, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Locations.create(client, params)
  end
end
