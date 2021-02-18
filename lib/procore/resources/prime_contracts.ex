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
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/prime_contract")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  Gets the Prime Contract for the Project.
  """
  @spec find(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(prime_contract_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(
        client,
        %{"project_id" => project_id, "prime_contract_id" => prime_contract_id} = options
      ) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/prime_contract/#{prime_contract_id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates a the Prime Contract for a Project.
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(attachments :: String.t()) => list,
          required(prime_contract :: String.t()) => map,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{
          "project_id" => project_id,
          "attachments" => _attachments,
          "prime_contract" => prime_contract
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/prime_contract")
    |> Request.insert_body(%{"project_id" => project_id, "prime_contract" => prime_contract})
    |> Procore.send_request(client)
  end
end
