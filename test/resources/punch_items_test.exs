defmodule Procore.Resources.PunchItemsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.PunchItems

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             PunchItems.list(params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "punch_item" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             PunchItems.create(params)
  end
end
