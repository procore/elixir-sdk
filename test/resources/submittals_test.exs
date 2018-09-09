defmodule Procore.Resources.SubmittalsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Submittals

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Submittals.find(client, params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Submittals.list(client, params)
  end

  test "list_potential_responsible_contractors/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Submittals.list_potential_responsible_contractors(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "submittal" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Submittals.create(client, params)
  end
end
