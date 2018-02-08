defmodule Procore.Resources.ProjectTools do
  @moduledoc """
  Available actions for the project resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Returns all Tools available to the provided Project.
  """
  @spec list(map) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/tools")
    |> Procore.send_request()
  end

  @doc """
  Updates all Tools available to the provided Project.
  """
  @spec list(map) :: %ResponseResult{} | %ErrorResult{}
  def update(%{"project_id" => project_id, "project_tools" => project_tools}) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/tools")
    |> Request.insert_body(%{tools: project_tools})
    |> Procore.send_request()
  end
end
