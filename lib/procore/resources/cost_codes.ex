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
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/cost_codes")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end
end
