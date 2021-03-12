defmodule Procore.Resources.ScheduleResources do
  @moduledoc """
  Available actions for the schedule resource resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all schedule resources in a project.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/resources")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Create a schedule resource.
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => _project_id, "resource" => _resource} = options) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/resources")
    |> Request.insert_body(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end
end
