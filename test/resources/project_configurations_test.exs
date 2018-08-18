defmodule Procore.Resources.ProjectConfigurationsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ProjectConfigurations

  doctest Procore.Resources.ProjectConfigurations
  client = Procore.client()

  test "get/1" do
    client = Procore.client()
    params = %{"project_id" => 2}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectConfigurations.find(params)
  end
end
