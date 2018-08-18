defmodule Procore.Resources.Meetings do
  @moduledoc """
  Available actions for the meeting resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Gets a meeting with assoication records attendees, attachments, and meeting categories.
  """
  @spec find(Tesla.Client.t(), %{
          (meeting_id :: String.t()) => pos_integer,
          (project_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"meeting_id" => meeting_id, "project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/meetings/#{meeting_id}")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  List all meetings in a project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/meetings")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Creates a meeting.
  """
  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (meeting :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => _project_id, "meeting" => _meeting} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/meetings")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
