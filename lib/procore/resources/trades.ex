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
  @spec list(%{(company_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/trades")
    |> Procore.send_request()
  end
end
