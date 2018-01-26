defmodule Procore.Resources.ProjectConfigurationsTest do
  use ExUnit.Case
  alias Procore.Resources.ProjectConfigurations
  doctest Procore.Resources.ProjectConfigurations

  test "get/1" do
    params = %{"project_id" => 2}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             ProjectConfigurations.find(params)
  end
end
