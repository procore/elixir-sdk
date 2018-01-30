defmodule Procore.Resources.Meetings do
  @moduledoc """
  Available requests for the meeting resource.
  """

  alias Procore.Request

  @doc """
  Gets a meeting with assoication records attendees, attachments, and meeting categories.
  """
  @spec find(%{
          (meeting_id :: String.t()) => pos_integer,
          (project_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(%{"meeting_id" => meeting_id, "project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/meetings/#{meeting_id}")
    |> Request.insert_query_params(params)
    |> Procore.make_request()
  end

  @doc """
  List all meetings in a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/meetings")
    |> Request.insert_query_params(params)
    |> Procore.make_request()
  end
end
