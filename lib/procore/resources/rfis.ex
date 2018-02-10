defmodule Procore.Resources.Rfis do
  @moduledoc """
  Available actions for the RFI resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all RFIs in a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/rfis")
    |> Procore.send_request()
  end

  @doc """
  Creates a RFI.
  """
  @spec create(%{(project_id :: String.t()) => pos_integer, (rfi :: String.t()) => map}) ::
          %ResponseResult{} | %ErrorResult{}
  def create(%{"project_id" => project_id, "rfi" => rfi}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/rfis")
    |> Request.insert_body(%{"rfi" => rfi})
    |> Procore.send_request()
  end
end
