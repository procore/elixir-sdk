defmodule Procore.Resources.ImagesTest do
  use ExUnit.Case
  alias Procore.Resources.Images

  test "list/1" do
    params = %{"project_id" => 1, "image_category_id" => 2}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} = Images.list(params)
  end
end
