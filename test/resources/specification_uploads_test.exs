defmodule Procore.SpecificationUploadsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.SpecificationUploads

  test "create/1 with default API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "specification_upload" => %{:specification_set_id => "1", :files => []}
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             SpecificationUploads.create(client, params)
  end

  test "create/1 with specified rest API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "specification_upload" => %{:specification_set_id => "1", :files => []},
      "api_version" => "v1.1"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             SpecificationUploads.create(client, params)
  end

  test "create/1 with specified vapid API version" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "specification_upload" => %{:specification_set_id => "1", :files => []},
      "api_version" => "vapid"
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             SpecificationUploads.create(client, params)
  end
end
