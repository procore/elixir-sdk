defmodule Procore.Resources.PrimeContractsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.PrimeContracts

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PrimeContracts.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "attachments" => [], "prime_contract" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             PrimeContracts.create(params)
  end
end
