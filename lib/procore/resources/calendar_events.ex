defmodule Procore.Resources.CalendarEvents do
  @moduledoc """
  Available requests for the calendar event resource.
  """

  alias Procore.Request

  @doc """
  Lists all calendar events for a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/calendar_events")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.make_request()
  end
end
