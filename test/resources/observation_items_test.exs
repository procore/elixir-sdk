defmodule Procore.Resources.ObservationItemsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ObservationItems

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ObservationItems.list(client, params)
  end

  test "find/1" do
    client = Procore.client()
    params = %{"observation_item_id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ObservationItems.find(params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "observation" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ObservationItems.create(client, params)
  end
end
