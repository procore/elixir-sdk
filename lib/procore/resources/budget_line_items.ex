defmodule Procore.Resources.BudgetLineItems do
  @moduledoc """
  Available actions for the Budget Line Item resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists the Budget Line Items for a Project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/budget_line_items")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end

  @doc """
  Gets a Budget Line Item for a Project.
  """
  @spec find(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"project_id" => project_id, "id" => id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/budget_line_items/#{id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates a Budget Line Item for a Project.
  """
  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (budget_line_item :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => _project_id, "budget_line_item" => _budget_line_item} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/budget_line_items")
    |> Request.insert_body(params)
    |> Procore.send_request(client)
  end

  @doc """
  Updates a Budget Line Item for a Project.
  """
  @spec update(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (budget_line_item :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def update(client, %{"project_id" => _project_id, "budget_line_item" => %{"id" => id}} = params) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/budget_line_items/#{id}")
    |> Request.insert_body(params)
    |> Procore.send_request(client)
  end
end
