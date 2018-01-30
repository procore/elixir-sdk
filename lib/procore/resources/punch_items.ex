defmodule Procore.Resources.PunchItems do
  @moduledoc """
  Available requests for the punch item resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all punch items in a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/punch_items")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.make_request()
  end
end
