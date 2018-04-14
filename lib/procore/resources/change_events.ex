defmodule Procore.Resources.ChangeEvents do
  @moduledoc """
  Available actions for the Change Event resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Change Events with associated records in a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/change_events")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Creates a Change Event with its nested, optional, Change Event Line Items.
  """
  @spec create(%{
          (project_id :: String.t()) => pos_integer,
          (attachments :: String.t()) => list,
          (change_event :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(%{
        "project_id" => project_id,
        "attachments" => attachments,
        "change_event" => change_event
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/change_events")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Request.insert_body(%{"attachments" => attachments, "change_event" => change_event})
    |> Procore.send_request()
  end
end
