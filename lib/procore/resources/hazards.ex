defmodule Procore.Resources.Hazards do
  @moduledoc """
  Available actions for the Hazard resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Hazards in a Project.
  """
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/hazards")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  Gets a single Hazard.
  """
  @spec find(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(hazard_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"company_id" => company_id, "hazard_id" => hazard_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/hazards/#{hazard_id}")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates an Hazard.
  """
  @spec create(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(hazard :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"company_id" => company_id, "hazard" => _hazard} = options) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/hazards")
    |> Request.insert_body(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end
end
