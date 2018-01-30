alias Procore.ResponseResult

defmodule Procore.Resources.CalendarEventsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.CalendarEvents

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CalendarEvents.list(params)
  end
end
