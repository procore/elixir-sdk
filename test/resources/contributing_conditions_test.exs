defmodule Procore.Resources.ContributingConditionsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ContributingConditions

  test "list/1" do
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ContributingConditions.list(params)
  end

  test "find/1" do
    params = %{"contributing_condition_id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ContributingConditions.find(params)
  end

  test "create/1" do
    params = %{"company_id" => 1, "contributing_condition" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ContributingConditions.create(params)
  end
end
