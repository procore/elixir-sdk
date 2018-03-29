defmodule Procore.Resources.PrimeContracts do
  @moduledoc """
  Available actions for the Prime Contract resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists the Prime Contract for a Project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/prime_contract")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Creates a the Prime Contract for a Project.
  """
  @spec create(%{
          (project_id :: String.t()) => pos_integer,
          (attachments :: String.t()) => list,
          (prime_contract :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        %{
          "project_id" => _project_id,
          "attachments" => _attachments,
          "prime_contract" => _prime_contract
        } = params
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/prime_contract")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
