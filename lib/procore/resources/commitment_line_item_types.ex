defmodule Procore.Resources.CommitmentLineItemTypes do
  @moduledoc """
  Available actions for the Line Item Types for commitments.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Line Item Types in a company.
  """
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => _company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/line_item_types")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  Creates or updates a batch of Line Item Types for a company.
  """
  @spec sync(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(line_item_types :: String.t()) => list,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def sync(client, %{"company_id" => company_id, "line_item_types" => line_item_types} = options) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/line_item_types/sync")
    |> Request.insert_body(%{"company_id" => company_id, "updates" => line_item_types})
    |> Procore.send_request(client)
  end
end
