defmodule Procore.Resources.CommitmentLineItemTypesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.CommitmentLineItemTypes

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CommitmentLineItemTypes.list(params)
  end

  test "sync/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "line_item_types" => []}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             CommitmentLineItemTypes.sync(params)
  end
end
