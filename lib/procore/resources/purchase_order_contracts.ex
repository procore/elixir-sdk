defmodule Procore.Resources.PurchaseOrderContracts do
  @moduledoc """
  Available actions for the Purchase Order Contract resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Purchase Order Contracts in a project.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/purchase_order_contracts")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  Returns a Purchase Order Contract and associated records.
  """
  @spec find(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(purchase_order_contract_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(
        client,
        %{
          "project_id" => project_id,
          "purchase_order_contract_id" => purchase_order_contract_id
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/purchase_order_contracts/#{purchase_order_contract_id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates or updates a batch of Purchase Order Contracts.
  """
  @spec sync(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(rfi :: String.t()) => list,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def sync(
        client,
        %{
          "project_id" => project_id,
          "purchase_order_contracts" => purchase_order_contracts
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/purchase_order_contracts/sync")
    |> Request.insert_body(%{"project_id" => project_id, "updates" => purchase_order_contracts})
    |> Procore.send_request(client)
  end
end
