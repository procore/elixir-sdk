defmodule Procore.Resources.ImagesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Images

  test "list/1 with default API version" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Images.list(client, params)
  end

  test "list/1 with specified rest API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "v1.1"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Images.list(client, params)
  end

  test "list/1 with specified vapid API version" do
    client = Procore.client()
    params = %{"project_id" => 1, "api_version" => "vapid"}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Images.list(client, params)
  end

  test "create/1 with default API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "image_category_id" => 1,
      "filename" => "filename.jpg",
      "path_to_file" => "/path/to/file/filename.jpg"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Images.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "image_category_id" => 1,
      "filename" => "filename.jpg",
      "path_to_file" => "/path/to/file/filename.jpg",
      "api_version" => "v1.1"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Images.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "image_category_id" => 1,
      "filename" => "filename.jpg",
      "path_to_file" => "/path/to/file/filename.jpg",
      "api_version" => "vapid"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Images.create(client, params)
  end
end
