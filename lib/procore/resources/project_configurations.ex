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
  @spec find(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.GetProjectConfiguration.t(),
            reply: atom
          }
          | %ErrorResult{}
  def find(client, %{"project_id" => _project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/project_configuration")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  Updates a project configuration.
  """
  @spec update(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.GetProjectConfiguration.t(),
            reply: atom
          }
          | %ErrorResult{}
  def update(
        client,
        %{
          "project_id" => project_id,
          "project_configuration" => project_configuration
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/configuration")
    |> Request.insert_body(%{configuration: project_configuration})
    |> Procore.send_request(client)
  end
end
