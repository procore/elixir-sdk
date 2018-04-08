defmodule Procore.Resources.SpecificationUploads do
  @moduledoc """
  Available actions for the SpecificationUploads resource.
  https://developers.procore.com/reference/specification-uploads
  """
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  # require IEx
  #
  # @spec create(%{
  #         (project_id :: String.t()) => pos_integer,
  #         (specification_upload :: String.t()) => map
  #       }) :: %ResponseResult{} | %ErrorResult{}
  # def create(%{
  #       "project_id" => project_id,
  #       "specification_upload" => spec_upload
  #     }) do
  #   %Request{}
  #   |> Request.insert_request_type(:post)
  #   |> Request.insert_endpoint("/vapid/projects/#{project_id}/specification_uploads")
  #   |> Request.insert_body(build_create_body(spec_upload))
  #   |> Procore.send_request()
  # end
  #
  # alias Tesla.Multipart
  #
  # defp build_create_body(spec_upload) do
  #   Multipart.new()
  #   |> Multipart.add_content_type_param("charset=utf-8")
  #   |> Multipart.add_field("specification_set_id", to_string(spec_upload[:specification_set_id]))
  #   |> Multipart.add_file("/Users/jasongittler/Procore/mason/files/procore_vortex_specs.pdf", name: "files[]")
  # end
end
