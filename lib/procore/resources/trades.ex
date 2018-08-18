defmodule Procore.Resources.Trades do
  @moduledoc """
  Available actions for the vendor resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Trades in a company.
  """
  @spec list(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/trades")
    |> Procore.send_request()
  end

  @doc """
  Creates a Trade.
  """
  @spec create(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer,
          (trade :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"company_id" => company_id, "trade" => trade}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/trades")
    |> Request.insert_body(%{"trade" => trade})
    |> Procore.send_request()
  end
end
