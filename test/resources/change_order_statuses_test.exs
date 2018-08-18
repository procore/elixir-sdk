defmodule Procore.Resources.ChangeOrderStatusesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ChangeOrderStatuses

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ChangeOrderStatuses.list(client, params)
  end
end
