defmodule Procore.Resources.MeetingTopics do
  @moduledoc """
  Available actions for the meeting topic resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Creates a meeting topic.
  """
  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (meeting_id :: String.t()) => pos_integer,
          (meeting_topic :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{
          "project_id" => _project_id,
          "meeting_id" => _meeting_id,
          "meeting_topic" => _meeting_topic
        } = params
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/rest/v1.0/meeting_topics")
    |> Request.insert_body(params)
    |> Procore.send_request(client)
  end
end
