defmodule Procore.Resources.ScheduleTodos do
  @moduledoc """
  Available actions for the schedule todo resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Creates or updates a batch of todos.
  """
  @spec sync(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (todos :: String.t()) => list
        }) :: %ResponseResult{} | %ErrorResult{}
  def sync(client, %{"project_id" => project_id, "todos" => todos}) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/todos/sync")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Request.insert_body(%{"udpates" => todos})
    |> Procore.send_request(client)
  end
end
