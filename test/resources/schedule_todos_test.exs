defmodule Procore.Resources.ScheduleTodosTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ScheduleTodos

  test "sync/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "todos" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ScheduleTodos.sync(client, params)
  end
end
