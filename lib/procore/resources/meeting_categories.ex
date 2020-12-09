defmodule Procore.Resources.MeetingCategories do
  @moduledoc """
  Available actions for the meeting category resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Creates a meeting category.
  """
  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (meeting_id :: String.t()) => pos_integer,
          (meeting_category :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{
          "project_id" => _project_id,
          "meeting_id" => _meeting_id,
          "meeting_category" => _meeting_category
        } = params
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/rest/v1.0/meeting_categories")
    |> Request.insert_body(params)
    |> Procore.send_request(client)
  end
end
