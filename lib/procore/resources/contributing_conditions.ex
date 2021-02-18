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
  @spec list(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/contributing_conditions")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  Gets a single ContributingCondition.
  """
  @spec find(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(contributing_condition_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(
        client,
        %{
          "company_id" => company_id,
          "contributing_condition_id" => contributing_condition_id
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint(
      "/companies/#{company_id}/contributing_conditions/#{contributing_condition_id}"
    )
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates an ContributingCondition.
  """
  @spec create(Tesla.Client.t(), %{
          required(company_id :: String.t()) => pos_integer,
          required(contributing_condition :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{"company_id" => company_id, "contributing_condition" => _contributing_condition} =
          options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/companies/#{company_id}/contributing_conditions")
    |> Request.insert_body(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end
end
