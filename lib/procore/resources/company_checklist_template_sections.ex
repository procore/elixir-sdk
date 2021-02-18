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
          required(company_id :: String.t()) => pos_integer,
          required(list_template_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(
        client,
        %{"company_id" => company_id, "list_template_id" => list_template_id} = options
      ) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint(
      "/companies/#{company_id}/checklist/list_templates/#{list_template_id}/sections"
    )
    |> Procore.send_request(client)
  end

  @doc """
  Returns Checklist Template.
  """
  @spec find(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(section_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"company_id" => company_id, "section_id" => section_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/checklist/sections/#{section_id}")
    |> Procore.send_request(client)
  end

  @doc """
  Bulk Creates Company Checklist Sections for a specified Checklist Template.
  """
  @spec bulk_create(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(list_template_id :: String.t()) => pos_integer,
          required(sections :: String.t()) => List.t(),
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def bulk_create(
        client,
        %{
          "company_id" => company_id,
          "list_template_id" => list_template_id,
          "sections" => sections
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint(
      "/companies/#{company_id}/checklist/list_templates/#{list_template_id}/sections/bulk_create"
    )
    |> Request.insert_body(%{
      "sections" => sections
    })
    |> Procore.send_request(client)
  end
end
