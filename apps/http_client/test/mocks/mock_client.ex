defmodule HttpClient.MockClient do
  # need to add non-json response tests

  @procore_host Application.fetch_env!(:http_client, :host)
  @response_bodies_dir "#{File.cwd!()}/test/mocks/response_bodies"

  def load_response_body(file_name) do
    File.read!("#{@response_bodies_dir}/#{file_name}")
    |> Poison.decode!()
  end

  defp response_200 do
    %ResponseResult{status_code: 200, parsed_body: %{}, reply: :ok}
  end

  defp response_201 do
    %ResponseResult{status_code: 201, parsed_body: %{}, reply: :ok}
  end

  @spec get(String.t(), any, any) :: %ResponseResult{} | %ErrorResult{}

  def get("#{@procore_host}/vapid/offices", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: load_response_body("list_offices.json"),
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/project_configuration", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: load_response_body("get_project_configuration.json"),
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/company/1/users", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: load_response_body("list_company_users.json"),
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/vendors", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: [],
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/locations", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: [],
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/projects/1/bid_packages", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: [],
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/resources", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: [],
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/calendar_events", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: [],
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/meetings/1", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: %{},
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/meetings", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: [],
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/punch_items", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: [],
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/projects/1/rfis", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: [],
      reply: :ok
    }
  end

  def get("#{@procore_host}/vapid/projects/1/submittals", _, _) do
    %ResponseResult{
      status_code: 200,
      parsed_body: [],
      reply: :ok
    }
  end

  def get(url, _, _) when binary_part(url, 0, 24) == @procore_host do
    response_200()
  end

  def get("http://mock/success_200", _, _) do
    response_200()
  end

  def get("http://mock/redirect_301", _, _) do
    %ResponseResult{status_code: 301, parsed_body: %{}}
  end

  def get("http://mock/error_404", _, _) do
    %ErrorResult{reason: "not found"}
  end

  def get("http://mock/error_500", _, _) do
    %ErrorResult{reason: "internal server error"}
  end

  @spec post(String.t(), any, any) :: %ResponseResult{} | %ErrorResult{}

  def post(url, _, _) when binary_part(url, 0, 24) == @procore_host do
    response_201()
  end

  def post("http://mock/success_200", _, _) do
    response_200()
  end

  def post("http://mock/success_201", _, _) do
    response_201()
  end

  def post("http://mock/error_422", _, _) do
    %ErrorResult{reason: "unprocessable entity"}
  end

  def post("http://mock/error_500", _, _) do
    %ErrorResult{reason: "internal server error"}
  end

  @spec post_multipart(String.t(), any, any) :: %ResponseResult{} | %ErrorResult{}

  def post_multipart("http://mock/success_201", _, _) do
    response_201()
  end

  def post_multipart("http://mock/error_422", _, _) do
    %ErrorResult{reason: "unprocessable entity"}
  end

  def post_multipart("http://mock/error_500", _, _) do
    %ErrorResult{reason: "internal server error"}
  end

  @spec patch(String.t(), any, any) :: %ResponseResult{} | %ErrorResult{}
  def patch("http://mock/success_200", _, _) do
    response_200()
  end

  def patch("http://mock/error_422", _, _) do
    %ErrorResult{reason: "unprocessable entity"}
  end

  def patch("http://mock/error_500", _, _) do
    %ErrorResult{reason: "internal server error"}
  end
end
