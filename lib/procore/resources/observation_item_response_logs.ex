defmodule Procore.Resources.ObservationItemResponseLogs do
  @moduledoc """
  Available actions for the ObservationItemResponseLog resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all ObservationItemResponseLogs in a ObservationItem.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(observation_item_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id, "observation_item_id" => item_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/observations/items/#{item_id}/response_logs")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates an ObservationItemResponseLog.
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(response_log :: String.t()) => map,
          optional(status :: String.t()) => String.t(),
          optional(attachments :: String.t()) => list,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{
          "project_id" => project_id,
          "reponse_log" => response_log,
          "status" => status,
          "attachments" => attachments,
          "observation_item_id" => item_id
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/observations/items/#{item_id}/response_logs")
    |> Request.insert_body(%{
      "project_id" => project_id,
      "response_log" => response_log,
      "status" => status,
      "attachments" => attachments
    })
    |> Procore.send_request(client)
  end
end
