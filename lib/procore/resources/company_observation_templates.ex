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
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/observation_templates")
    |> Procore.send_request(client)
  end

  @doc """
  Creates an observation template for a company.
  """
  @spec create(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer,
          (observation_template :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{"company_id" => company_id, "observation_template" => observation_template} = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/observation_templates")
    |> Request.insert_body(%{"observation_template" => observation_template})
    |> Procore.send_request(client)
  end
end
