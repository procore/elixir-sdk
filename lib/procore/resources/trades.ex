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
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/trades")
    |> Procore.send_request(client)
  end

  @doc """
  Creates a Trade.
  """
  @spec create(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(trade :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"company_id" => company_id, "trade" => trade} = options) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/trades")
    |> Request.insert_body(%{"trade" => trade})
    |> Procore.send_request(client)
  end
end
