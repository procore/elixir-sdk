defmodule Procore.Resources.ObservationTypesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ObservationTypes

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ObservationTypes.list(params)
  end
end
