defmodule Procore.Resources.Images do
  @moduledoc """
  Available actions for the image resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all images in a Project.
  """
  @spec list(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = options) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/images")
    |> Request.insert_query_params(Map.drop(options, ["api_version"]))
    |> Procore.send_request(client)
  end

  @doc """
  Creates an image within an image category (album).
  """
  @spec create(Tesla.Client.t(), %{
          required(project_id :: String.t()) => pos_integer,
          required(image_category_id :: String.t()) => pos_integer,
          required(filename :: String.t()) => String.t(),
          required(path_to_file :: String.t()) => String.t(),
          optional(api_version :: String.t()) => String.t()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(
        client,
        %{
          "project_id" => project_id,
          "image_category_id" => image_category_id,
          "filename" => filename,
          "path_to_file" => path_to_file
        } = options
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_api_version(options["api_version"])
    |> Request.insert_endpoint("/images")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Request.insert_body(build_create_body(image_category_id, filename, path_to_file))
    |> Procore.send_request(client)
  end

  alias Tesla.Multipart

  require IEx

  defp build_create_body(image_category_id, filename, path_to_file) do
    Multipart.new()
    |> Multipart.add_content_type_param("charset=utf-8")
    |> Multipart.add_field("image[name]", filename)
    |> Multipart.add_field("image[image_category_id]", Integer.to_string(image_category_id))
    |> Multipart.add_file(path_to_file, name: "image[data]", detect_content_type: true)
  end
end
