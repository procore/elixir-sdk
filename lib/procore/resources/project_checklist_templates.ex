defmodule Procore.Resources.ProjectChecklistTemplates do
  @moduledoc """
  Available actions for the Checklist Template resource at the project level.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Checklist Template for a Project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/checklist/list_templates")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Returns a Project Checklist Template.
  """
  @spec find(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (list_template_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"project_id" => project_id, "list_template_id" => list_template_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/checklist/list_templates/#{list_template_id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates a Project Checklist Template from a Company Checklist Template.
  """
  @spec create_from_company_template(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (source_template_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def create_from_company_template(
        client,
        %{"project_id" => _project_id, "source_template_id" => _source_template_id} = params
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/checklist/list_templates/create_from_company_template")
    |> Request.insert_body(params)
    |> Procore.send_request(client)
  end
end
