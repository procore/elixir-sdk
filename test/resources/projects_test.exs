defmodule Procore.Resources.ProjectsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Projects

  test "find/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Projects.find(client, params)
  end

  test "find/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Projects.find(client, params)
  end

  test "find/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Projects.find(client, params)
  end

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Projects.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Projects.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Projects.list(client, params)
  end

  test "create/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "project" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Projects.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "project" => %{}, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Projects.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "project" => %{}, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Projects.create(client, params)
  end
end
