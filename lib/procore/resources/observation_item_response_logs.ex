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
  @spec list(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id, "observation_item_id" => item_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/observations/items/#{item_id}/response_logs")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Gets a single ObservationItemResponseLog.
  """
  @spec find(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer,
          (observationitemresponse_log_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"project_id" => project_id, "observation_item_id" => item_id, "id" => id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/observations/items/#{item_id}/response_logs/#{id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates an ObservationItemResponseLog.
  """
  @spec create(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer,
          (observationitemresponse_log :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{
        "project_id" => project_id,
        "reponse_log" => response_log,
        "status" => status,
        "attachments" => attachments,
        "observation_item_id" => item_id
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/observations/items/#{item_id}/response_logs")
    |> Request.insert_body(%{
      "project_id" => project_id,
      "response_log" => response_log,
      "status" => status,
      "attachments" => attachments
    })
    |> Procore.send_request(client)
  end
end
