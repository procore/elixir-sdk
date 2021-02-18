defmodule Procore.Resources.MeetingsCategoriesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.MeetingCategories

  test "create/1 with default API version" do
    client = Procore.client()
    params = %{"meeting_id" => 1, "project_id" => 1, "meeting_category" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             MeetingCategories.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()

    params = %{
      "meeting_id" => 1,
      "project_id" => 1,
      "meeting_category" => %{},
      "api_version" => "v1.1"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             MeetingCategories.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()

    params = %{
      "meeting_id" => 1,
      "project_id" => 1,
      "meeting_category" => %{},
      "api_version" => "vapid"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             MeetingCategories.create(client, params)
  end
end
