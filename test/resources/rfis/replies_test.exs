defmodule Procore.Resources.Rfis.RepliesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Rfis.Replies

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "rfi_id" => 1, "reply" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Replies.create(client, params)
  end
end
