defmodule Procore.Resources.ProjectChecklists do
  @moduledoc """
  Available actions for the Checklist resource.
  """
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists Inspection Checklists in a specified Project.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/checklist/lists")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Returns Project Checklist.
  """
  @spec find(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(checklist_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"project_id" => project_id, "checklist_id" => checklist_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/checklist/lists/#{checklist_id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates Project Checklist.
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(template_id :: String.t()) => pos_integer,
          required(list :: String.t()) => map(),
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{"project_id" => project_id, "template_id" => template_id, "list" => list} = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/checklist/lists")
    |> Request.insert_body(%{
      "project_id" => project_id,
      "template_id" => template_id,
      "list" => list,
      "attachments" => list["attachments"]
    })
    |> Procore.send_request(client)
  end
end
