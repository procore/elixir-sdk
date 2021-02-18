defmodule Procore.Resources.ChangeEventStatuses do
  @moduledoc """
  Available actions for the Change Event resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Change Event Statuses with associated records in a project.
  """
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => _company_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(params["api_version"])
    |> Request.insert_endpoint("/change_event/statuses")
    |> Request.insert_query_params(Map.drop(params, ["version"]))
    |> Procore.send_request(client)
  end
end
