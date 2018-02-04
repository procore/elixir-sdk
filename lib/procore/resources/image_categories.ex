defmodule Procore.Resources.ImageCategories do
  @moduledoc """
  Available actions for the image category resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all images in a image category (album).
  """
  @spec create(%{(project_id :: String.t()) => pos_integer, (image_category :: String.t()) => map}) ::
          %ResponseResult{} | %ErrorResult{}
  def create(%{"project_id" => project_id, "image_category" => image_category}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/image_categories")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Request.insert_body(%{"image_category" => image_category})
    |> Procore.send_request()
  end
end
