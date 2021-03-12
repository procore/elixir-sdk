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
          required(project_id :: String.t()) => pos_integer,
          required(rfi_id :: String.t()) => pos_integer,
          required(reply :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{"project_id" => project_id, "rfi_id" => rfi_id, "reply" => reply} = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/rfis/#{rfi_id}/replies")
    |> Request.insert_body(%{"reply" => reply})
    |> Procore.send_request(client)
  end
end
