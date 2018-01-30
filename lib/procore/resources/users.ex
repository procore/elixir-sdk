defmodule Procore.Resources.Users do
  @moduledoc """
  Available requests for the user resource.
  """
  alias Procore.Resources.Users.ResponseBodyTypes
  alias Procore.Request

  @doc """
  Adds an existing user from a company to a project's directory in that company.
  """
  @spec add_user_to_project(%{
          (project_id :: String.t()) => integer,
          (user_id :: String.t()) => integer,
          (permission_template_id :: String.t()) => integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def add_user_to_project(%{
        "project_id" => project_id,
        "user_id" => user_id,
        "permission_template_id" => permission_template_id
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/users/#{user_id}/actions/add")
    |> Request.insert_body(build_add_user_to_project_body(permission_template_id))
    |> Procore.make_request()
  end

  defp build_add_user_to_project_body(permission_template_id) do
    %{"user" => %{"permission_template_id" => permission_template_id}}
  end

  @doc """
  List all users in a company directory.
  """
  @spec list(%{(company_id :: String.t()) => integer}) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.ListCompanyUsers.t(),
            reply: atom
          }
          | %ErrorResult{}
  def list(%{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/company/#{company_id}/users")
    |> Procore.make_request()
  end
end
