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
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/tools")
    |> Procore.send_request(client)
  end

  @doc """
  Updates all tools available to the provided Project.
  """
  @spec update(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(project_tools :: String.t()) => list,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def update(client, %{"project_id" => project_id, "project_tools" => project_tools} = options) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/tools")
    |> Request.insert_body(%{tools: project_tools})
    |> Procore.send_request(client)
  end
end
