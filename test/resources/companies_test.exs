defmodule Procore.Resources.CompaniesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Companies

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Companies.find(client, params)
  end

  test "list/1" do
    client = Procore.client()

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} = Companies.list(client)
  end
end
