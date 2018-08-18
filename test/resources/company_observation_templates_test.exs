defmodule Procore.Resources.CompanyObservationTemplatesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.CompanyObservationTemplates

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CompanyObservationTemplates.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "observation_template" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             CompanyObservationTemplates.create(params)
  end
end
