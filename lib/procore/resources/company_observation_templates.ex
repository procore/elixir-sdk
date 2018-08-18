defmodule Procore.Resources.CompanyObservationTemplates do
  @moduledoc """
  Available actions for the Observation Template resource for a company.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all observation templates for a company.
  """
  @spec list(%{(company_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/observation_templates")
    |> Procore.send_request()
  end

  @doc """
  Creates an observation template for a company.
  """
  @spec create(%{
          (company_id :: String.t()) => pos_integer,
          (observation_template :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"company_id" => company_id, "observation_template" => observation_template}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/observation_templates")
    |> Request.insert_body(%{"observation_template" => observation_template})
    |> Procore.send_request()
  end
end
