defmodule Procore.Resources.ContributingBehaviors do
  @moduledoc """
  Available actions for the ContributingBehavior resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all ContributingBehaviors in a Project.
  """
  @spec list(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/contributing_behaviors")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Gets a single ContributingBehavior.
  """
  @spec find(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer,
          (contributing_behavior_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{
        "company_id" => company_id,
        "contributing_behavior_id" => contributing_behavior_id
      }) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint(
      "/vapid/companies/#{company_id}/contributing_behaviors/#{contributing_behavior_id}"
    )
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request()
  end

  @doc """
  Creates an ContributingBehavior.
  """
  @spec create(%{
          (company_id :: String.t()) => pos_integer,
          (contributing_behavior :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        %{"company_id" => company_id, "contributing_behavior" => _contributing_behavior} = params
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/contributing_behaviors")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
