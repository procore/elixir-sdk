defmodule HttpClient.MockClient do
  alias Procore.ResponseResult

  @spec get(String.t(), any, any) :: %ResponseResult{}

  def get(_, "/rest/v1.0/companies/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/companies", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/observation_templates", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/submittal_statuses", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/observations/types", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/observations/items", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/observations/items/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/observations/items/1/response_logs", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/contributing_behaviors", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/contributing_behaviors/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/contributing_conditions", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/contributing_conditions/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/hazards", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/hazards/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/inspection_types", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/submittal_packages", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/change_events", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/checklist/lists/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/rfis/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/rfis", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/submittals/1", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/submittals", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/users", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/users", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/vendors", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/trades", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/checklist/list_templates", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/checklist/list_templates/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/projects", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/permission_templates", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/checklist/list_templates/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/bid_packages", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/checklist/list_templates/1/sections", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/companies/1/checklist/sections/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/cost_codes", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/change_order/statuses", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/change_event/statuses", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/work_order_contracts/1/line_items", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/purchase_order_contracts/1/line_items", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/line_item_types", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/work_order_contracts", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/work_order_contracts/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/purchase_order_contracts", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/purchase_order_contracts/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/prime_contract", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/prime_contract/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/checklist/list_templates", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/checklist/lists", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/offices", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/project_configuration", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/vendors", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/locations", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/resources", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/calendar_events", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/meetings/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/rest/v1.0/meetings", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/punch_items", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/submittals/potential_responsible_contractors", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/images", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/rest/v1.0/projects/1/drawing_areas", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  @spec post(String.t(), any, any, any) :: %ResponseResult{}

  def post(_, "/rest/v1.0/companies/1/contributing_behaviors", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/companies/1/contributing_conditions", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/companies/1/hazards", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/companies/1/observation_templates", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/observations/items", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/observations/items/1/response_logs", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/companies/1/inspection_types", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/images", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/change_events", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/companies/1/checklist/list_templates/1/sections/bulk_create", _, _) do
    %ResponseResult{status_code: 201, parsed_body: [], reply: :ok}
  end

  def post(_, "/rest/v1.0/work_order_contracts/1/line_items", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/purchase_order_contracts/1/line_items", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/prime_contract", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/checklists/list_templates/create_from_company_template", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/companies/1/checklist/list_templates", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/checklist/lists", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/projects/1/bid_packages", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/locations", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/projects", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/projects/1/vendors/1/actions/add", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/projects/1/users/1/actions/add", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/meetings", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/meeting_categories", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/meeting_topics", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/punch_items", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/projects/1/rfis", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/projects/1/rfis/1/replies", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/resources", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/tasks", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/projects/1/submittals", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/projects/1/drawing_areas", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/companies/1/trades", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/rest/v1.0/checklist/list_templates/create_from_company_template", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  @spec patch(String.t(), any, any) :: %ResponseResult{}

  def patch(_, "/rest/v1.0/line_item_types/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def patch(_, "/rest/v1.0/work_order_contracts/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def patch(_, "/rest/v1.0/purchase_order_contracts/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def patch(_, "/rest/v1.0/todos/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def patch(_, "/rest/v1.0/companies/1/users/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def patch(_, "/rest/v1.0/vendors/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end
end
