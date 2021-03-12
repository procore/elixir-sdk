defmodule Procore.Resources.BidPackages do
  @moduledoc """
  Available actions for the bid package resource.
  """
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  List all bid projects in a project.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/bid_packages")
    |> Procore.send_request(client)
  end

  @doc """
  Creates a bid package.
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => integer,
          required(bid_package :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => project_id, "bid_package" => bid_package} = options) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/bid_packages")
    |> Request.insert_body(%{"bid_package" => bid_package})
    |> Procore.send_request(client)
  end
end
