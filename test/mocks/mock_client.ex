defmodule HttpClient.MockClient do
  alias Procore.ResponseResult

  @spec get(String.t(), any, any) :: %ResponseResult{}

  def get(_, "/vapid/companies/1/observation_templates", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/companies/1/inspection_types", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/checklist/lists/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/projects/1/rfis", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/projects/1/submittals", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/companies/1/users", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/projects/1/users", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/projects/1/vendors", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/companies/1/trades", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/companies/1/checklist/list_templates", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/checklist/list_templates/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/projects/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/projects/1/permission_templates", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/companies/1/checklist/list_templates/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/projects/1/bid_packages", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/companies/1/checklist/list_templates/1/sections", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/companies/1/checklist/sections/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/cost_codes", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/work_order_contracts/1/line_items", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/line_item_types", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/work_order_contracts", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/work_order_contracts/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/prime_contract", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/companies/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/checklist/list_templates", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/checklist/lists", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/offices", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/projects", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/project_configuration", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/vendors", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/locations", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/resources", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/calendar_events", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/meetings/1", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get(_, "/vapid/meetings", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/punch_items", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/projects/1/submittals/potential_responsible_contractors", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/images", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(_, "/vapid/projects/1/drawing_areas", _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  @spec post(String.t(), any, any) :: %ResponseResult{}

  def post(_, "/vapid/companies/1/observation_templates", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/companies/1/inspection_types", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/images", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/companies/1/checklist/list_templates/1/sections/bulk_create", _) do
    %ResponseResult{status_code: 201, parsed_body: [], reply: :ok}
  end

  def post(_, "/vapid/work_order_contracts/1/line_items", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/prime_contract", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/checklists/list_templates/create_from_company_template", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/companies/1/checklist/list_templates", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/checklist/lists", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/projects/1/bid_packages", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/locations", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/projects", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/projects/1/vendors/1/actions/add", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/projects/1/users/1/actions/add", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/meetings", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/meeting_categories", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/meeting_topics", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/punch_items", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/projects/1/rfis", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/resources", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/tasks", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/projects/1/submittals", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/projects/1/drawing_areas", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/companies/1/trades", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(_, "/vapid/checklist/list_templates/create_from_company_template", _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  @spec patch(String.t(), any, any) :: %ResponseResult{}

  def patch(_, "/vapid/line_item_types/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def patch(_, "/vapid/work_order_contracts/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def patch(_, "/vapid/todos/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def patch(_, "/vapid/companies/1/users/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def patch(_, "/vapid/vendors/sync", _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end
end
