defmodule HttpClient.MockClient do
  alias Procore.ErrorResult
  alias Procore.ResponseResult

  @procore_host Application.get_env(:procore, :host, "https://api.procore.com")

  @spec get(String.t(), any, any) :: %ResponseResult{} | %ErrorResult{}

  def get("#{@procore_host}/vapid/companies/1/checklist/list_templates/1/sections", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/companies/1/checklist/sections/1", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get("#{@procore_host}/vapid/companies/1/checklist/list_templates", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/companies/1/checklist/list_templates/1", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get("#{@procore_host}/vapid/checklist/list_templates", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/checklist/list_templates/1", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get("#{@procore_host}/vapid/checklist/lists", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/checklist/lists/1", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get("#{@procore_host}/vapid/offices", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/projects/1/permission_templates", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/project_configuration", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get("#{@procore_host}/vapid/companies/1/users", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/projects/1/users", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/vendors", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/projects/1/vendors", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/locations", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/projects/1/bid_packages", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/resources", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/calendar_events", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/meetings/1", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def get("#{@procore_host}/vapid/meetings", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/punch_items", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/projects/1/rfis", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/projects/1/submittals", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/projects/1/submittals/potential_responsible_contractors", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/images", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/projects/1/drawing_areas", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get("#{@procore_host}/vapid/companies/1/trades", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def get(url, _, _) when binary_part(url, 0, 23) == @procore_host do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  @spec post(String.t(), any, any) :: %ResponseResult{} | %ErrorResult{}

  def post(
        "#{@procore_host}/vapid/companies/1/checklist/list_templates/1/sections/bulk_create",
        _,
        _
      ) do
    %ResponseResult{status_code: 201, parsed_body: [], reply: :ok}
  end

  def post("#{@procore_host}/vapid/checklists/list_templates/create_from_company_template", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/companies/1/checklist/list_templates", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/checklist/lists", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/projects/1/bid_packages", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/locations", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/vendors/sync", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/todos/sync", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def post("#{@procore_host}/vapid/projects/1/vendors/1/actions/add", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/projects/1/users/1/actions/add", _, _) do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/meetings", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/meeting_categories", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/meeting_topics", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/punch_items", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/projects/1/rfis", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/resources", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/tasks", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/projects/1/submittals", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/projects/1/drawing_areas", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post(url, _, _) when binary_part(url, 0, 23) == @procore_host do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  def post("#{@procore_host}/vapid/companies/1/trades", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  @spec post_multipart(String.t(), any, any) :: %ResponseResult{} | %ErrorResult{}

  def post_multipart("#{@procore_host}/vapid/images", _, _) do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  @spec patch(String.t(), any, any) :: %ResponseResult{} | %ErrorResult{}

  def patch("#{@procore_host}/vapid/companies/1/users/sync", _, _) do
    %ResponseResult{status_code: 200, parsed_body: [], reply: :ok}
  end

  def patch(url, _, _) when binary_part(url, 0, 23) == @procore_host do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end
end
