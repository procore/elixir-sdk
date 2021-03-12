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
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/submittal_packages")
    |> Procore.send_request(client)
  end
end
