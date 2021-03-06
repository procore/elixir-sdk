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
          required(project_id :: String.t()) => pos_integer,
          required(meeting_id :: String.t()) => pos_integer,
          required(meeting_topic :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{
          "project_id" => _project_id,
          "meeting_id" => _meeting_id,
          "meeting_topic" => _meeting_topic
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/meeting_topics")
    |> Request.insert_body(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end
end
