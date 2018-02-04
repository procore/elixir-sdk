defmodule Procore.Resources.Vendors do
  @moduledoc """
  Available actions for the vendor resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.Resources.Vendors.ResponseBodyTypes
  alias Procore.ResponseResult

  @doc """
  List all vendors in a company directory.
  """
  @spec list(%{(company_id :: String.t()) => integer}) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.ListCompanyVendors.t(),
            reply: atom
          }
          | %ErrorResult{}
  def list(%{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/vendors")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request()
  end

  @doc """
  Adds an existing vendor from a company to a project's directory in that company.
  """
  @spec add_vendor_to_project(%{
          (project_id :: String.t()) => pos_integer,
          (vendor_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def add_vendor_to_project(%{
        "project_id" => project_id,
        "vendor_id" => vendor_id
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/vendors/#{vendor_id}/actions/add")
    |> Procore.send_request()
  end

  @doc """
  Creates vendors in a company.
  """
  @spec bulk_create(%{
          (company_id :: String.t()) => pos_integer,
          (vendors :: String.t()) => list
        }) :: %ResponseResult{} | %ErrorResult{}
  def bulk_create(%{
        "company_id" => company_id,
        "vendors" => vendors
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/vendors/sync")
    |> Request.insert_body(%{"company_id" => company_id, "updates" => vendors})
    |> Procore.send_request()
  end
end
