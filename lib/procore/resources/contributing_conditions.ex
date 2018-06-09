defmodule Procore.Resources.ContributingConditions do
  @moduledoc """
  Available actions for the ContributingCondition resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all ContributingConditions in a Project.
  """
  @spec list(%{(company_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"company_id" => company_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/contributing_conditions")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Gets a single ContributingCondition.
  """
  @spec find(%{
          (company_id :: String.t()) => pos_integer,
          (contributing_condition_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(%{"company_id" => company_id, "contributing_condition_id" => contributing_condition_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint(
      "/vapid/companies/#{company_id}/contributing_conditions/#{contributing_condition_id}"
    )
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request()
  end

  @doc """
  Creates an ContributingCondition.
  """
  @spec create(%{
          (company_id :: String.t()) => pos_integer,
          (contributing_condition :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        %{"company_id" => company_id, "contributing_condition" => _contributing_condition} =
          params
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/contributing_conditions")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
