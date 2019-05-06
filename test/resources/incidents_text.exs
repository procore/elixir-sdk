defmodule Procore.Resources.IncidentsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Hazards

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Incidents.list(client, params)
  end

  test "find/1" do
    client = Procore.client()
    params = %{"incident_id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Incidents.find(client, params)
  end

  test "create/1" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "incident" => %{
        title: "Material Spill",
        hazard_id: 1
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Incidents.create(client, params)
  end

  test "update/1" do
    client = Procore.client()

    params = %{
      "project_id" => 1,
      "incident_id" => 1,
      "incident" => %{
        title: "Crane Topple",
        hazard_id: 1
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Incidents.update(client, params)
  end
end
