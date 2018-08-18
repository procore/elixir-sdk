defmodule Procore.Resources.SubmittalsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Submittals

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
             Submittals.list_potential_responsible_contractors(params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "submittal" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Submittals.create(params)
  end
end
