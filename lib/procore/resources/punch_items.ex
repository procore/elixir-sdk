defmodule Procore.Resources.PunchItems do
  @moduledoc """
  Available actions for the punch item resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all punch items in a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/punch_items")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Creates a punch item.
  """
  @spec create(%{(project_id :: String.t()) => pos_integer, (punch_item :: String.t()) => map}) ::
          %ResponseResult{} | %ErrorResult{}
  def create(%{"project_id" => _project_id, "punch_item" => _punch_item} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/punch_items")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
