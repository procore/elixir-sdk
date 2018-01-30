alias Procore.ResponseResult

defmodule Procore.Resources.OfficesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Offices

  doctest Procore.Resources.Offices

  test "list/1" do
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: [_]} = Offices.list(params)
  end
end
