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
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.ListCompanyVendors.t(),
            reply: atom
          }
          | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/vendors")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request(client)
  end

  @doc """
  Lists all vendors in a project directory.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/vendors")
    |> Procore.send_request(client)
  end

  @doc """
  Adds an existing vendor from a company to a project's directory in that company.
  """
  @spec add_vendor_to_project(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(vendor_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def add_vendor_to_project(
        client,
        %{
          "project_id" => project_id,
          "vendor_id" => vendor_id
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/vendors/#{vendor_id}/actions/add")
    |> Procore.send_request(client)
  end

  @doc """
  Creates or updates a batch of vendors in a company directory.
  """
  @spec sync(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(vendors :: String.t()) => list,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def sync(
        client,
        %{
          "company_id" => company_id,
          "vendors" => vendors
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vendors/sync")
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_body(%{"company_id" => company_id, "updates" => vendors})
    |> Procore.send_request(client)
  end
end
