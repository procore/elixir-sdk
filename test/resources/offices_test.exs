defmodule Procore.Resources.OfficesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Offices

  doctest Procore.Resources.Offices
  client = Procore.client()

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Offices.list(client, params)
  end
end
