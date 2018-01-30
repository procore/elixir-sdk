defmodule Procore.Resources.BidPackages do
  @moduledoc """
  Available actions for the bid package resource.
  """
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  List all bid projects in a project.
  """
  @spec list(%{(project_id :: String.t()) => integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/bid_packages")
    |> Procore.make_request()
  end
end
