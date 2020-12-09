defmodule Procore.Resources.CostCodes do
  @moduledoc """
  Available actions for the Cost Code resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists the Cost Codes for a Project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/rest/v1.0/cost_codes")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end
end
