defmodule Procore.Resources.ProjectTools do
  @moduledoc """
  Available actions for the tools resource for a project.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Returns all tools available to the provided Project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/tools")
    |> Procore.send_request()
  end

  @doc """
  Updates all tools available to the provided Project.
  """
  @spec update(%{(project_id :: String.t()) => pos_integer, (project_tools :: String.t()) => list}) ::
          %ResponseResult{} | %ErrorResult{}
  def update(%{"project_id" => project_id, "project_tools" => project_tools}) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/tools")
    |> Request.insert_body(%{tools: project_tools})
    |> Procore.send_request()
  end
end
