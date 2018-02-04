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
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/resources")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end
end
