defmodule Procore.Resources.SpecificationSets do
  @moduledoc """
  Available actions for the SpecificationSets resource.
  https://developers.procore.com/reference/specification-sets
  """
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Gets a specification set.
  """
  @spec find(%{
          (project_id :: String.t()) => pos_integer,
          (id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"project_id" => project_id, "id" => id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/specification_sets/#{id}")
    |> Procore.send_request()
  end

  @doc """
  List all SpecificationSets in a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/specification_sets")
    |> Procore.send_request()
  end

  @doc """
  Creates a meeting.
  """
  @spec create(%{
          (project_id :: String.t()) => pos_integer,
          (specification_set :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => project_id, "specification_set" => spec_set}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/specification_sets")
    |> Request.insert_body(spec_set)
    |> Procore.send_request()
  end
end
