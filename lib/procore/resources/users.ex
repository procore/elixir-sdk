defmodule Procore.Resources.Users do
  @moduledoc """
  Available actions for the user resource.
  """
  alias Procore.Resources.Users.ResponseBodyTypes
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Adds an existing user from a company to a project's directory in that company.
  """
  @spec add_user_to_project(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(user_id :: String.t()) => pos_integer,
          required(permission_template_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def add_user_to_project(
        client,
        %{
          "project_id" => project_id,
          "user_id" => user_id,
          "permission_template_id" => permission_template_id
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/users/#{user_id}/actions/add")
    |> Request.insert_body(build_add_user_to_project_body(permission_template_id))
    |> Procore.send_request(client)
  end

  defp build_add_user_to_project_body(permission_template_id) do
    %{"user" => %{"permission_template_id" => permission_template_id}}
  end

  @doc """
  Lists all users in a company directory.
  """
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.ListCompanyUsers.t(),
            reply: atom
          }
          | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/users")
    |> Procore.send_request(client)
  end

  @doc """
  Lists all users in a project directory.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/projects/#{project_id}/users")
    |> Procore.send_request(client)
  end

  @doc """
  Creates or updates a batch of users in a company directory.
  """
  @spec sync(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(users :: String.t()) => list,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def sync(
        client,
        %{
          "company_id" => company_id,
          "users" => users
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/users/sync")
    |> Request.insert_body(%{"updates" => users})
    |> Procore.send_request(client)
  end
end
