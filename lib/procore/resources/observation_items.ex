defmodule Procore.Resources.ObservationItems do
  @moduledoc """
  Available actions for the Observation Item resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Observation Items in a Project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/observations/items")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Gets a single Observation Item.
  """
  @spec find(%{
          (project_id :: String.t()) => pos_integer,
          (observation_item_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"project_id" => project_id, "observation_item_id" => observation_item_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/observations/items/#{observation_item_id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

  @doc """
  Creates an Observation Item.
  """
  @spec create(%{
          (project_id :: String.t()) => pos_integer,
          (observation_item :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => _project_id, "observation" => _observation_item} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/observations/items")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
