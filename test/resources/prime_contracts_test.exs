defmodule Procore.Resources.PrimeContractsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.PrimeContracts

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PrimeContracts.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PrimeContracts.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PrimeContracts.list(client, params)
  end

  test "find/2 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "prime_contract_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PrimeContracts.find(client, params)
  end

  test "find/2 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "prime_contract_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PrimeContracts.find(client, params)
  end

  test "find/2 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "prime_contract_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             PrimeContracts.find(client, params)
  end

  test "create/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "attachments" => [], "prime_contract" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             PrimeContracts.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "attachments" => [],
      "prime_contract" => %{},
      "api_version" => "v1.1"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             PrimeContracts.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "attachments" => [],
      "prime_contract" => %{},
      "api_version" => "vapid"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             PrimeContracts.create(client, params)
  end
end
