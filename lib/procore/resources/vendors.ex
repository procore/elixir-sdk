defmodule Procore.Resources.Vendors do
  @moduledoc """
  Available actions for the vendor resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.Resources.Vendors.ResponseBodyTypes
  alias Procore.ResponseResult

  @doc """
  Lists all vendors in a company directory.
  """
  @spec list(%{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.ListCompanyVendors.t(),
            reply: atom
          }
          | %ErrorResult{}
  def list(client, %{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/vendors")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request()
  end

  @doc """
  Lists all vendors in a project directory.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/vendors")
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
  Creates or updates a batch of vendors in a company directory.
  """
  @spec sync(%{
          (company_id :: String.t()) => pos_integer,
          (vendors :: String.t()) => list
        }) :: %ResponseResult{} | %ErrorResult{}
  def sync(%{
        "company_id" => company_id,
        "vendors" => vendors
      }) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/vendors/sync")
    |> Request.insert_body(%{"company_id" => company_id, "updates" => vendors})
    |> Procore.send_request()
  end
end
