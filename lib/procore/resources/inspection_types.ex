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
  @spec list(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/inspection_types")
    |> Procore.send_request()
  end

  @doc """
  Creates an Inspection Type.
  """
  @spec create(%{
          (company_id :: String.t()) => pos_integer,
          (inspection_type :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"company_id" => company_id, "inspection_type" => inspection_type}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/inspection_types")
    |> Request.insert_body(%{"inspection_type" => inspection_type})
    |> Procore.send_request()
  end
end
