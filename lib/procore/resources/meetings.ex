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
          required(meeting_id :: String.t()) => pos_integer,
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"meeting_id" => meeting_id, "project_id" => _project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/meetings/#{meeting_id}")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  List all meetings in a project.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/meetings")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  Creates a meeting.
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(meeting :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => _project_id, "meeting" => _meeting} = options) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/meetings")
    |> Request.insert_body(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end
end
