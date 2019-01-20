defmodule Procore.Resources.ImagesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Images

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Images.list(client, params)
  end

  test "create/1" do
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
end
