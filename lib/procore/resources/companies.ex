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
  @spec find(Tesla.Client.t(), %{
          required(id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"id" => id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{id}")
    |> Procore.send_request(client)
  end

  @doc """
  List companies.
  """
  @spec list(Tesla.Client.t(), %{
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies")
    |> Procore.send_request(client)
  end
end
