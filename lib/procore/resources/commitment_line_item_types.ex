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
  @spec list(%{(company_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"company_id" => _company_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/line_item_types")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Creates or updates a batch of Line Item Types for a company.
  """
  @spec sync(%{(company_id :: String.t()) => pos_integer, (line_item_types :: String.t()) => list}) ::
          %ResponseResult{} | %ErrorResult{}
  def sync(%{"company_id" => company_id, "line_item_types" => line_item_types}) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/line_item_types/sync")
    |> Request.insert_body(%{"company_id" => company_id, "updates" => line_item_types})
    |> Procore.send_request()
  end
end
