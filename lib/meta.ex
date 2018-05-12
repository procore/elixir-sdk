defmodule Procore.Meta do
  def gen(resource_name, company_or_project) do
    if !Enum.member?(["company", "project"], company_or_project) do
      raise "second argument must be either 'company' or 'project'"
    end

    resource_code = ~S'''
    defmodule Procore.Resources.<%= res %>s do
      @moduledoc """
      Available actions for the <%= res %> resource.
      """

      alias Procore.ErrorResult
      alias Procore.Request
      alias Procore.ResponseResult

      @doc """
      Lists all <%= res %>s in a Project.
      """
      @spec list(%{(<%= provider_singular %>_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
      def list(%{"<%= provider_singular %>_id" => <%= provider_singular %>_id} = params) do
        %Request{}
        |> Request.insert_request_type(:get)
        |> Request.insert_endpoint("/vapid/<%= provider_plural %>/#{<%= provider_singular %>_id}/<%= res_down %>s")
        |> Request.insert_query_params(params)
        |> Procore.send_request()
      end

      @doc """
      Gets a single <%= res %>.
      """
      @spec find(%{
              (<%= provider_singular %>_id :: String.t()) => pos_integer,
              (<%= res_down %>_id :: String.t()) => pos_integer
            }) :: %ResponseResult{} | %ErrorResult{}
      def find(%{"<%= provider_singular %>_id" => <%= provider_singular %>_id, "<%= res_down %>_id" => <%= res_down %>_id}) do
        %Request{}
        |> Request.insert_request_type(:get)
        |> Request.insert_endpoint("/vapid/<%= provider_plural %>/#{<%= provider_singular %>_id}/<%= res_down %>s/#{<%= res_down %>_id}")
        |> Request.insert_query_params(%{"<%= provider_singular %>_id" => <%= provider_singular %>_id})
        |> Procore.send_request()
      end

      @doc """
      Creates an <%= res %>.
      """
      @spec create(%{
              (<%= provider_singular %>_id :: String.t()) => pos_integer,
              (<%= res_down %> :: String.t()) => map
            }) :: %ResponseResult{} | %ErrorResult{}
      def create(%{"<%= provider_singular %>_id" => <%= provider_singular %>_id, "<%= res_down %>" => _<%= res_down %>} = params) do
        %Request{}
        |> Request.insert_request_type(:post)
        |> Request.insert_endpoint("/vapid/<%= provider_plural %>/#{<%= provider_singular %>_id}/<%= res_down %>s")
        |> Request.insert_body(params)
        |> Procore.send_request()
      end
    end
    '''

    resource_test_code = ~S'''
    defmodule Procore.Resources.<%= res %>sTest do
      use ExUnit.Case
      alias Procore.ResponseResult
      alias Procore.Resources.<%= res %>s

      test "list/1" do
        params = %{"<%= provider_singular %>_id" => 1}

        assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
                 <%= res %>s.list(params)
      end

      test "find/1" do
        params = %{"<%= res_down %>_id" => 1, "<%= provider_singular %>_id" => 1}

        assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
                 <%= res %>s.find(params)
      end

      test "create/1" do
        params = %{"<%= provider_singular %>_id" => 1, "<%= res_down %>" => %{}}

        assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
                 <%= res %>s.create(params)
      end
    end
    '''

    resource_name = Recase.to_pascal(resource_name)
    res_down = Recase.to_snake(resource_name)

    provider_singular = if company_or_project == "company", do: "company", else: "project"
    provider_plural = if company_or_project == "company", do: "companies", else: "projects"

    resource_file_path = Path.expand("./lib/procore/resources/#{res_down}s.ex") |> Path.absname
    resource_test_file_path = Path.expand("./test/resources/#{res_down}s_test.exs") |> Path.absname

    File.write!(
      resource_file_path,
      EEx.eval_string(
        resource_code,
        res: resource_name,
        res_down: res_down,
        provider_singular: provider_singular,
        provider_plural: provider_plural
      )
    )

    File.write!(
      resource_test_file_path,
      EEx.eval_string(
        resource_test_code,
        res: resource_name,
        res_down: res_down,
        provider_singular: provider_singular,
        provider_plural: provider_plural
      )
    )
  end
end
