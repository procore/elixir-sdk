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
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/rest/v1.0/projects/#{project_id}/bid_packages")
    |> Procore.send_request(client)
  end

  @doc """
  Creates a bid package.
  """
  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => integer,
          (bid_package :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => project_id, "bid_package" => bid_package}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/rest/v1.0/projects/#{project_id}/bid_packages")
    |> Request.insert_body(%{"bid_package" => bid_package})
    |> Procore.send_request(client)
  end
end
