defmodule Procore.Resources.WorkOrderContractLineItems do
  @moduledoc """
  Available actions for the Work Order Contract Line Item resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Line Items for a specific Work Order Contract.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(work_order_contract_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(
        client,
        %{
          "project_id" => project_id,
          "work_order_contract_id" => work_order_contract_id
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/work_order_contracts/#{work_order_contract_id}/line_items")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates a Work Order Contract Line Item.
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(work_order_contract_id :: String.t()) => pos_integer,
          required(line_item :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{
          "project_id" => project_id,
          "work_order_contract_id" => work_order_contract_id,
          "line_item" => line_item
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/work_order_contracts/#{work_order_contract_id}/line_items")
    |> Request.insert_body(%{"project_id" => project_id, "line_item" => line_item})
    |> Procore.send_request(client)
  end
end
