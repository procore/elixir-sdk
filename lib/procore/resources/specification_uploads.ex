defmodule Procore.Resources.SpecificationUploads do
  @moduledoc """
  Available actions for the SpecificationUploads resource.
  https://developers.procore.com/reference/specification-uploads
  """
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @spec create(%{
          (project_id :: String.t()) => pos_integer,
          (specification_upload :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(%{
        "project_id" => project_id,
        "specification_upload" => spec_upload
      }) do
    %Request{}
    |> Request.insert_request_type(:post_multipart)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/specification_uploads")
    |> Request.insert_body(build_create_body(spec_upload))
    |> Procore.send_request()
  end

  def build_create_body(spec_upload) do
    file_tuples = Enum.map(spec_upload[:files], fn(path_to_file) ->
     create_file_tuple(path_to_file)
    end)

    {
      :multipart,
      Enum.concat(
        [
          {"specification_set_id", to_string(spec_upload[:specification_set_id])}
        ],
        file_tuples
      )
    }
  end

  defp create_file_tuple(path_to_file) do
    filename = String.split(path_to_file, "/") |> List.last()

    {
      :file,
      path_to_file,
      {"form-data", [name: "files[]", filename: filename]},
      []
    }
  end

end
