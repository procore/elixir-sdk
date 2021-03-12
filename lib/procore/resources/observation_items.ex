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
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/observations/items")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  Gets a single Observation Item.
  """
  @spec find(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(observation_item_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(
        client,
        %{"project_id" => project_id, "observation_item_id" => observation_item_id} = options
      ) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/observations/items/#{observation_item_id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates an Observation Item.
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(observation_item :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => _project_id, "observation" => _observation_item} = options) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/observations/items")
    |> Request.insert_body(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end
end
