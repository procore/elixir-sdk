defmodule Procore.Resources.Incidents do
  @moduledoc """
  Available actions for the Incident resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Incidents in a Project.
  """
  @spec list(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/incidents")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end

  @doc """
  Gets a single Incident.
  """
  @spec find(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (incident_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(
        client,
        %{
          "project_id" => project_id,
          "incident_id" => incident_id
        } = params
      ) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/incidents/#{incident_id}")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end

  @doc """
  Creates an Incident.
  """
  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (incident :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{
          "project_id" => project_id,
          "incident" => _incident
        } = body
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/incidents")
    |> Request.insert_body(body)
    |> Procore.send_request(client)
  end

  @doc """
  Updates an Incident.
  """
  @spec update(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (incident_id :: String.t()) => pos_integer,
          (incident :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def update(
        client,
        %{
          "project_id" => project_id,
          "incident_id" => incident_id,
          "incident" => _incident
        } = body
      ) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/incidents/#{incident_id}")
    |> Request.insert_body(body)
    |> Procore.send_request(client)
  end
end
