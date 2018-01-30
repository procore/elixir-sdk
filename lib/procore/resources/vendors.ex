defmodule Procore.Resources.Vendors do
  @moduledoc """
  Available requests for the vendor resource.
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
    |> Procore.make_request()
  end
end
