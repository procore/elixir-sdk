defmodule Procore.Resources.UsersTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Users

  test "add_user_to_project/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "user_id" => 1, "permission_template_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Users.add_user_to_project(params)
  end

  test "list/1 for company directory" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Users.list(client, params)
  end

  test "list/1 for project directory" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Users.list(client, params)
  end

  test "sync/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "users" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} = Users.sync(params)
  end
end
