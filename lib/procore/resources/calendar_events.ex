defmodule Procore.Resources.CalendarEvents do
  @moduledoc """
  Available actions for the calendar event resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all calendar events for a project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/calendar_events")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end
end
