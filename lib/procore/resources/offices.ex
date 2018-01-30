defmodule Procore.Resources.Offices do
  @moduledoc """
  Available requests for the office resource.
  """

  alias Procore.Resources.Offices.ResponseBodyTypes
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all offices in a company.

  ## Examples
  iex> Procore.Resources.Offices.list(%{"company_id" => 1})
  %ResponseResult{
    status_code: 200,
    parsed_body: [%{
      "address" => "201 N Central Ave",
      "city" => "Phoenix",
      "country_code" => "US",
      "division" => nil,
      "fax" => "6023333300",
      "id" => 12557,
      "name" => "Arizona Office",
      "phone" => "6023333333",
      "state_code" => "AZ",
      "zip" => "85004"
    }],
    reply: :ok
  }
  """
  @spec list(%{(company_id :: String.t()) => integer}) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.ListOffices.t(),
            reply: atom
          }
          | %ErrorResult{}
  def list(%{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/offices")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.make_request()
  end
end
