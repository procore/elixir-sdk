defmodule Procore.Resources.MeetingsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Meetings

  test "find/1" do
    client = Procore.client()
    params = %{"meeting_id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} = Meetings.find(params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} = Meetings.list(params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "meeting" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Meetings.create(params)
  end
end
