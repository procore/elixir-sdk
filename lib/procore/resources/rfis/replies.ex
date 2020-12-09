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
  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (rfi_id :: String.t()) => pos_integer,
          (reply :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => project_id, "rfi_id" => rfi_id, "reply" => reply}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/rest/v1.0/projects/#{project_id}/rfis/#{rfi_id}/replies")
    |> Request.insert_body(%{"reply" => reply})
    |> Procore.send_request(client)
  end
end
