defmodule Procore.Resources.Rfis do
  @moduledoc """
  Available actions for the RFI resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Find a RFI in a project.
  """
  @spec find(Tesla.Client.t(), %{
          (id :: String.t()) => pos_integer,
          (project_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"id" => id, "project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/rfis/#{id}")
    |> Procore.send_request(client)
  end

  @doc """
  Lists all RFIs in a project.
  """
  @spec list(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (serializer_view :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id, "serializer_view" => serializer_view}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/rfis")
    |> Request.insert_query_params(%{"serializer_view" => serializer_view})
    |> Procore.send_request(client)
  end

  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/rfis")
    |> Procore.send_request(client)
  end

  @doc """
  Creates a RFI.
  """
  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (rfi :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => project_id, "rfi" => rfi}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/rfis")
    |> Request.insert_body(build_create_body(rfi))
    |> Procore.send_request(client)
  end

  alias Tesla.Multipart

  defp build_create_body(%{"question" => %{"attachments" => attachments}} = rfi) do
    rfi = Map.update!(rfi, "question", &Map.drop(&1, ["attachments"]))

    Multipart.new()
    |> Multipart.add_content_type_param("charset=utf-8")
    |> add_field("rfi", rfi)
    |> add_attachments(attachments)
  end

  defp build_create_body(rfi), do: %{"rfi" => rfi}

  defp add_attachments(multipart, attachments) do
    Enum.reduce(attachments, multipart, fn attachment, multipart ->
      Multipart.add_file_content(
        multipart,
        Map.fetch!(attachment, "file"),
        Map.fetch!(attachment, "name"),
        name: "rfi[question][attachments][]"
      )
    end)
  end

  defp add_field(multipart, key, %{} = value) do
    Enum.reduce(value, multipart, fn {nested_key, nested_value}, multipart ->
      add_field(multipart, "#{key}[#{nested_key}]", nested_value)
    end)
  end

  defp add_field(multipart, key, value) do
    Multipart.add_field(multipart, key, to_string(value))
  end
end
