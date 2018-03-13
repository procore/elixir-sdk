defmodule Procore.Resources.ProjectChecklistTemplates do
  @moduledoc """
  Available actions for the Checklist Template resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Checklist Template for a Project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/checklist/list_templates")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

  @doc """
  Returns Checklist Template.
  """
  @spec show(%{
          (project_id :: String.t()) => pos_integer,
          (list_template_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def show(%{"project_id" => project_id, "list_template_id" => list_template_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint(
      "/vapid/checklist/list_templates/#{list_template_id}"
    )
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

end
