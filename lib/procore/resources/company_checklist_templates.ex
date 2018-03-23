defmodule Procore.Resources.CompanyChecklistTemplates do
  @moduledoc """
  Available actions for the Checklist Template resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Checklist Template for a company.
  """
  @spec list(%{(company_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/checklist/list_templates")
    |> Procore.send_request()
  end

  @doc """
  Returns Checklist Template.
  """
  @spec show(%{
          (company_id :: String.t()) => pos_integer,
          (list_template_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def show(%{"company_id" => company_id, "list_template_id" => list_template_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint(
      "/vapid/companies/#{company_id}/checklist/list_templates/#{list_template_id}"
    )
    |> Procore.send_request()
  end

  @doc """
  Creates a company level Checklist Template.
  """
  @spec create(%{
          (company_id :: String.t()) => pos_integer,
          (list_template :: String.t()) => map,
          (attachments :: String.t()) => List.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(%{
        "company_id" => company_id,
        "list_template" => list_template,
        "attachments" => attachments
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/checklist/list_templates")
    |> Request.insert_body(%{
      "list_template" => list_template,
      "attachments" => attachments,
      "company_id" => company_id
    })
    |> Procore.send_request()
  end
end
