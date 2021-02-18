defmodule Procore.Resources.ScheduleTodosTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ScheduleTodos

  test "sync/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "todos" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ScheduleTodos.sync(client, params)
  end

  test "sync/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "todos" => [], "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ScheduleTodos.sync(client, params)
  end

  test "sync/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "todos" => [], "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ScheduleTodos.sync(client, params)
  end
end
