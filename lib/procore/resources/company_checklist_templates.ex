defmodule Procore.Resources.CompanyChecklistTemplates do
  @moduledoc """
  Available actions for the Checklist Template resource at the company level.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Checklist Template for a company.
  """
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/checklist/list_templates")
    |> Procore.send_request(client)
  end

  @doc """
  Returns Checklist Template.
  """
  @spec find(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(list_template_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(
        client,
        %{"company_id" => company_id, "list_template_id" => list_template_id} = options
      ) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint(
      "/companies/#{company_id}/checklist/list_templates/#{list_template_id}"
    )
    |> Procore.send_request(client)
  end

  @doc """
  Creates a company level Checklist Template.
  """
  @spec create(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(list_template :: String.t()) => map,
          required(attachments :: String.t()) => List.t(),
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{
          "company_id" => company_id,
          "list_template" => list_template,
          "attachments" => _attachments
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/checklist/list_templates")
    |> Request.insert_body(%{
      "list_template" => list_template,
      "company_id" => company_id
    })
    |> Procore.send_request(client)
  end
end
