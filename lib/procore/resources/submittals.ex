defmodule Procore.Resources.Submittals do
  @moduledoc """
  Available actions for the Submittal resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Find a submittal in a project.
  """
  @spec find(Tesla.Client.t(), %{
          required(id :: String.t()) => pos_integer,
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"id" => id, "project_id" => project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/submittals/#{id}")
    |> Procore.send_request(client)
  end

  @doc """
  Lists all submittals in a project.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id} = options) do
    query = %{
      "filters" => Map.get(options, "filters", %{})
    }

    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/submittals")
    |> Request.insert_query_params(query)
    |> Procore.send_request(client)
  end

  @doc """
  Creates a submittal.
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(submittal :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => project_id, "submittal" => submittal} = options) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/submittals")
    |> Request.insert_body(submittal)
    |> Procore.send_request(client)
  end

  @doc """
  Lists all potential responsible contractors.
  """
  @spec list_potential_responsible_contractors(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list_potential_responsible_contractors(client, %{"project_id" => project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint(
      "/projects/#{project_id}/submittals/potential_responsible_contractors"
    )
    |> Procore.send_request(client)
  end
end
