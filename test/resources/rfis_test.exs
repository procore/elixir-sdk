defmodule Procore.Resources.RfisTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Rfis

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Rfis.find(client, params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Rfis.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "rfi" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Rfis.create(client, params)
  end
end
