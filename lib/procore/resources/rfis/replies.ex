defmodule Procore.Resources.Rfis.Replies do
  @moduledoc """
  Available actions for the RFI Reply resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Creates a RFI Reply.
  """
  @spec create(%{
          (project_id :: String.t()) => pos_integer,
          (rfi_id :: String.t()) => pos_integer,
          (reply :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(%{"project_id" => project_id, "rfi_id" => rfi_id, "reply" => reply}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/rfis/#{rfi_id}/replies")
    |> Request.insert_body(%{"reply" => reply})
    |> Procore.send_request()
  end
end
