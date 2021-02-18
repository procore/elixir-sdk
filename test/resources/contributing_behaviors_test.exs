defmodule Procore.Resources.ContributingBehaviorsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ContributingBehaviors

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ContributingBehaviors.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ContributingBehaviors.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ContributingBehaviors.list(client, params)
  end

  test "find/1 with default API version" do
    client = Procore.client()
    params = %{"contributing_behavior_id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ContributingBehaviors.find(client, params)
  end

  test "find/1 with specified rest API version" do
    client = Procore.client()
    params = %{"contributing_behavior_id" => 1, "company_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ContributingBehaviors.find(client, params)
  end

  test "find/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"contributing_behavior_id" => 1, "company_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ContributingBehaviors.find(client, params)
  end

  test "create/1 with default API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "contributing_behavior" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ContributingBehaviors.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "contributing_behavior" => %{}, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ContributingBehaviors.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"company_id" => 1, "contributing_behavior" => %{}, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ContributingBehaviors.create(client, params)
  end
end
