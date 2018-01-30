defmodule Procore.Resources.Submittals do
  @moduledoc """
  Available requests for the submittal resource.
  """

  alias Procore.Request

  @doc """
  Lists all submittals in a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/submittals")
    |> Procore.make_request()
  end
end
