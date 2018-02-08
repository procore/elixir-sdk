defmodule Procore.Resources.ProjectConfigurations do
  @moduledoc """
  Available actions for the project_configuration resource.
  """

  alias Procore.Resources.ProjectConfigurations.ResponseBodyTypes
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Gets a project configuration.

  See `Procore.Resources.ProjectConfigurations.ResponseBodyTypes.GetProjectConfiguration.t/0` for response body.
  """
  @spec find(%{(project_id :: String.t()) => integer}) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.GetProjectConfiguration.t(),
            reply: atom
          }
          | %ErrorResult{}
  def find(%{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/project_configuration")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Updates a project configuration.
  """
  @spec update(%{(project_id :: String.t()) => integer}) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.GetProjectConfiguration.t(),
            reply: atom
          }
          | %ErrorResult{}
  def update(%{"project_id" => project_id, "project_configuration" => project_configuration}) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/configuration")
    |> Request.insert_body(%{configuration: project_configuration})
    |> Procore.send_request()
  end
end
