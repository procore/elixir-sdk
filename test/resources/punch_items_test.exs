defmodule Procore.Resources.PunchItemsTest do
  use ExUnit.Case
  alias Procore.Resources.PunchItems

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             PunchItems.list(params)
  end
end
