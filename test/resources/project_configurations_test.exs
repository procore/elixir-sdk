defmodule Procore.Resources.ProjectConfigurationsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ProjectConfigurations

  doctest Procore.Resources.ProjectConfigurations

  test "get/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 2}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectConfigurations.find(client, params)
  end

  test "get/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 2, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectConfigurations.find(client, params)
  end

  test "get/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 2, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectConfigurations.find(client, params)
  end
end
