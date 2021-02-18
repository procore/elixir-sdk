defmodule Procore.Resources.UsersTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Users

  test "add_user_to_project/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "user_id" => 1, "permission_template_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Users.add_user_to_project(client, params)
  end

  test "add_user_to_project/1 with specified rest API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "user_id" => 1,
      "permission_template_id" => 1,
      "api_version" => "v1.1"
    }

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Users.add_user_to_project(client, params)
  end

  test "add_user_to_project/1 with specified vapid API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "user_id" => 1,
      "permission_template_id" => 1,
      "api_version" => "vapid"
    }

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Users.add_user_to_project(client, params)
  end

  test "list/1 for company directory with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Users.list(client, params)
  end

  test "list/1 for company directory with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Users.list(client, params)
  end

  test "list/1 for company directory with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Users.list(client, params)
  end

  test "list/1 for project directory with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Users.list(client, params)
  end

  test "list/1 for project directory with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Users.list(client, params)
  end

  test "list/1 for project directory with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Users.list(client, params)
  end

  test "sync/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "users" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Users.sync(client, params)
  end

  test "sync/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "users" => [], "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Users.sync(client, params)
  end

  test "sync/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "users" => [], "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Users.sync(client, params)
  end
end
