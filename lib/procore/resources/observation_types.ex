defmodule Procore.Resources.ObservationTypes do
  @moduledoc """
  Available actions for the Observation Item resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Observation Types in a Project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/rest/v1.0/observations/types")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end
end
