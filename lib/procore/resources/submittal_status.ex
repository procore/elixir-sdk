defmodule Procore.Resources.SubmittalStatus do
  @moduledoc """
  Available actions for the Submittal Statuses resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  List all submittal status in a company
  """
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/submittal_statuses")
    |> Procore.send_request(client)
  end
end
