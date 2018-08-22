defmodule Procore.Resources.Companies do
  @moduledoc """
  Available actions for the company resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Gets a company.
  """
  @spec find(Tesla.Client.t(), %{(id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def find(client, %{"id" => id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{id}")
    |> Procore.send_request(client)
  end

  @doc """
  List companies.
  """
  @spec list(Tesla.Client.t()) :: %ResponseResult{} | %ErrorResult{}
  def list(client) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies")
    |> Procore.send_request(client)
  end
end
