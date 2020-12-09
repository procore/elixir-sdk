defmodule Procore.Resources.Projects do
  @moduledoc """
  Available actions for the project resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Gets a project.
  """
  @spec find(Tesla.Client.t(), map) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"company_id" => company_id, "project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/rest/v1.0/projects/#{project_id}")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request(client)
  end

  @doc """
  Lists projects.
  """
  @spec list(Tesla.Client.t(), map) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/rest/v1.0/projects")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates a project and all of it's required defaults and associations.
  """
  @spec create(Tesla.Client.t(), map) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"company_id" => company_id, "project" => project}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/rest/v1.0/projects")
    |> Request.insert_body(%{"company_id" => company_id, "project" => project})
    |> Procore.send_request(client)
  end
end
