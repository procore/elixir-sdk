defmodule Procore.Resources.PermissionTemplates do
  @moduledoc """
  Available actions for the permission template resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  List all permission templates in a project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/permission_templates")
    |> Procore.send_request()
  end
end
