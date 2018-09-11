defmodule Procore.Resources.SubmittalStatusTest do
  use ExUnit.Case

  alias Procore.ResponseResult
  alias Procore.Resources.SubmittalStatus

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             SubmittalStatus.list(client, params)
  end
end
