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
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.ListOffices.t(),
            reply: atom
          }
          | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/offices")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request(client)
  end
end
