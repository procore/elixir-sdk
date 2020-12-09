defmodule Procore.Resources.CompanyChecklistTemplateSections do
  @moduledoc """
  Available actions for the Checklist Template Section resource at the company level.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Checklist Template Sections.

  """
  @spec list(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer,
          (list_template_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id, "list_template_id" => list_template_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint(
      "/rest/v1.0/companies/#{company_id}/checklist/list_templates/#{list_template_id}/sections"
    )
    |> Procore.send_request(client)
  end

  @doc """
  Returns Checklist Template.
  """
  @spec find(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer,
          (section_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"company_id" => company_id, "section_id" => section_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/rest/v1.0/companies/#{company_id}/checklist/sections/#{section_id}")
    |> Procore.send_request(client)
  end

  @doc """
  Bulk Creates Company Checklist Sections for a specified Checklist Template.
  """
  @spec bulk_create(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer,
          (list_template_id :: String.t()) => pos_integer,
          (sections :: String.t()) => List.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def bulk_create(client, %{
        "company_id" => company_id,
        "list_template_id" => list_template_id,
        "sections" => sections
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint(
      "/rest/v1.0/companies/#{company_id}/checklist/list_templates/#{list_template_id}/sections/bulk_create"
    )
    |> Request.insert_body(%{
      "sections" => sections
    })
    |> Procore.send_request(client)
  end
end
