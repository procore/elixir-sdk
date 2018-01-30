defmodule Procore.Resources.Projects do
  @moduledoc """
  Available requests for the project resource.
  """

  alias Procore.Request

  @doc """
  Gets a project.
  """
  @spec find(map) :: %ResponseResult{} | %ErrorResult{}
  def find(%{"company_id" => company_id, "project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.make_request()
  end

  @doc """
  Creates a project and all of it's required defaults and associations.
  """
  @spec create(map) :: %ResponseResult{} | %ErrorResult{}
  def create(%{"company_id" => company_id, "project" => project}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects")
    |> Request.insert_body(%{"company_id" => company_id, "project" => project})
    |> Procore.make_request()
  end
end
