defmodule Procore.Resources.Locations do
  @moduledoc """
  Available actions for the location resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all locations in a project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/locations")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

  @doc """
  Creates a location.
  """
  @spec create(%{(project_id :: String.t()) => pos_integer, (location :: String.t()) => map}) ::
          %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => _project_id, "location" => _location} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/locations")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
