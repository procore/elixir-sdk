defmodule Procore.Resources.Offices do
  @moduledoc """
  Available actions for the office resource.
  """

  alias Procore.Resources.Offices.ResponseBodyTypes
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all offices in a company.
  """
  @spec list(%{(company_id :: String.t()) => pos_integer}) ::
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
    |> Procore.send_request()
  end
end
