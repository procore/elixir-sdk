defmodule Procore.Resources.Images do
  @moduledoc """
  Available requests for the image resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all images in a image category (album).
  """
  @spec list(map) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => _project_id, "image_category_id" => _image_category_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/images")
    |> Request.insert_query_params(params)
    |> Procore.make_request()
  end
end
