defmodule Procore.Resources.ContributingBehaviorsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ContributingBehaviors

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ContributingBehaviors.list(client, params)
  end

  test "find/1" do
    client = Procore.client()
    params = %{"contributing_behavior_id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ContributingBehaviors.find(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "contributing_behavior" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ContributingBehaviors.create(client, params)
  end
end
