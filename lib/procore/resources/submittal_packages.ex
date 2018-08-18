defmodule Procore.Resources.SubmittalPackages do
  @moduledoc """
  Available actions for the Submittal Package resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all submittal packages in a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/submittal_packages")
    |> Procore.send_request()
  end
end
