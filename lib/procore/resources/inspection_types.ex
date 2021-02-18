defmodule Procore.Resources.InspectionTypes do
  @moduledoc """
  Available actions for the Inspection Type resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Inspection Types for a company.
  """
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/inspection_types")
    |> Procore.send_request(client)
  end

  @doc """
  Creates an Inspection Type.
  """
  @spec create(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(inspection_type :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{"company_id" => company_id, "inspection_type" => inspection_type} = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/inspection_types")
    |> Request.insert_body(%{"inspection_type" => inspection_type})
    |> Procore.send_request(client)
  end
end
