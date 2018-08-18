defmodule Procore.Resources.SubmittalPackagessTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.SubmittalPackages

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             SubmittalPackages.list(params)
  end
end
