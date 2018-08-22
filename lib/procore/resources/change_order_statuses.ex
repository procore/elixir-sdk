defmodule Procore.Resources.ChangeOrderStatuses do
  @moduledoc """
  Available actions for the Change Event resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Change Order Statuses with associated records in a project.
  """
  @spec list(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => _company_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/change_order/statuses")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end
end
