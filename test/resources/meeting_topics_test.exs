defmodule Procore.Resources.MeetingsTopicsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.MeetingTopics

  test "create/1" do
    client = Procore.client()
    params = %{"meeting_id" => 1, "project_id" => 1, "meeting_topic" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             MeetingTopics.create(params)
  end
end
