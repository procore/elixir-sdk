defmodule Procore.Resources.SpecificationUploads do
  @moduledoc """
  Available actions for the Specification Upload resource.
  """
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (specification_upload :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{
        "project_id" => project_id,
        "specification_upload" => spec_upload
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/rest/v1.0/projects/#{project_id}/specification_uploads")
    |> Request.insert_body(build_create_body(spec_upload))
    |> Procore.send_request(client)
  end

  alias Tesla.Multipart

  defp build_create_body(spec_upload) do
    Multipart.new()
    |> Multipart.add_content_type_param("charset=utf-8")
    |> Multipart.add_field("specification_set_id", set_id(spec_upload))
    |> add_files(spec_upload)
  end

  defp set_id(%{specification_set_id: id} = _spec_upload), do: to_string(id)

  defp add_files(multipart, %{files: files} = _spec_upload) do
    Enum.reduce(files, multipart, fn file, acc ->
      acc
      |> Multipart.add_file(file, name: "files[]", headers: [{"Content-Type", "application/pdf"}])
    end)
  end
end
