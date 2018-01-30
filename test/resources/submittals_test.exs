defmodule Procore.Resources.SubmittalsTest do
  use ExUnit.Case
  alias Procore.Resources.Submittals

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Submittals.list(params)
  end
end
