defmodule Procore.Request do
  @moduledoc """
  Holds the information needed to make a HTTP request. Defines functions to store this information in the struct.
  """

  @type valid_request_type :: :get | :post

  @type t :: %__MODULE__{
          body: %{},
          endpoint: String.t(),
          query_params: %{},
          request_type: valid_request_type | :unset
        }

  defstruct body: %{},
            endpoint: "",
            query_params: %{},
            request_type: :unset

  @doc """
  Stores the request type. Should be a `valid_request_type`.
  """
  @spec insert_request_type(Request.t(), valid_request_type) :: Request.t()
  def insert_request_type(%__MODULE__{} = request, request_type) do
    %{request | request_type: request_type}
  end

  @doc """
  Stores the endpoint.
  """
  @spec insert_endpoint(Request.t(), String.t()) :: Request.t()
  def insert_endpoint(%__MODULE__{} = request, endpoint) do
    %{request | endpoint: endpoint}
  end

  @doc """
  Stores the query params as a map.
  """
  @spec insert_query_params(Request.t(), map) :: Request.t()
  def insert_query_params(%__MODULE__{} = request, query_params) do
    %{request | query_params: query_params}
  end

  @doc """
  Stores the request body.
  """
  @spec insert_body(Request.t(), map) :: Request.t()
  def insert_body(%__MODULE__{} = request, body) do
    %{request | body: body}
  end
end
