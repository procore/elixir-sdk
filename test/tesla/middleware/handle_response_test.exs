defmodule Tesla.Middleware.HandleResponseTest do
  use ExUnit.Case

  defmodule ResponseTestClient do
    use Tesla
    adapter(Tesla.Adapter.Hackney, recv_timeout: 30_000)

    plug(Tesla.Middleware.HandleResponse)
    plug(Tesla.Middleware.DecodeJson, engine: Jason)

    @json_headers [{"content-type", "application/json"}]

    adapter(fn env ->
      case env.url do
        "/ok" ->
          {:ok, %{env | status: 200, headers: @json_headers, body: "{\"response\": \"ok\"}"}}

        "/created" ->
          {:ok, %{env | status: 201, headers: @json_headers, body: "{\"response\": \"created\"}"}}

        "/accepted" ->
          {:ok,
           %{env | status: 202, headers: @json_headers, body: "{\"response\": \"accepted\"}"}}

        "/not_found" ->
          {:ok,
           %{env | status: 404, headers: @json_headers, body: "{\"response\": \"not_found\"}"}}

        "/gateway_timeout" ->
          {:ok,
           %{
             env
             | status: 504,
               headers: @json_headers,
               body: "{\"response\": \"gateway_timeout\"}"
           }}

        "/gateway_unavailable" ->
          {:ok,
           %{
             env
             | status: 503,
               headers: @json_headers,
               body: "{\"response\": \"gateway_unavailable\"}"
           }}

        "/error" ->
          {:error, :econnrefused}

        "/html" ->
          {:ok,
           %{env | status: 200, headers: [{"content-type", "not-json"}], body: "<h1>HTML</h1>"}}
      end
    end)
  end

  test "decodes json body for a 200" do
    assert %Procore.ResponseResult{
             reply: :ok,
             status_code: 200,
             parsed_body: %{"response" => "ok"}
           } = ResponseTestClient.get("/ok")
  end

  test "decodes json body for a 201" do
    assert %Procore.ResponseResult{
             reply: :ok,
             status_code: 201,
             parsed_body: %{"response" => "created"}
           } = ResponseTestClient.get("/created")
  end

  test "decodes json body for a 202" do
    assert %Procore.ResponseResult{
             reply: :ok,
             status_code: 202,
             parsed_body: %{"response" => "accepted"}
           } = ResponseTestClient.get("/accepted")
  end

  test "decodes json body for an unrecognized code" do
    assert %Procore.ResponseResult{
             reply: :unrecognized_code,
             status_code: 404,
             parsed_body: %{"response" => "not_found"}
           } = ResponseTestClient.get("/not_found")
  end

  test "returns error result for 504" do
    assert %Procore.ErrorResult{reply: :error, reason: :gateway_timeout} =
             ResponseTestClient.get("/gateway_timeout")
  end

  test "returns error result for 503" do
    assert %Procore.ErrorResult{reply: :error, reason: :gateway_unavailable} =
             ResponseTestClient.get("/gateway_unavailable")
  end

  test "returns error result for other errors" do
    assert %Procore.ErrorResult{reply: :error, reason: :econnrefused} =
             ResponseTestClient.get("/error")
  end

  test "doesn't try to decode non-json responses" do
    assert %Procore.ResponseResult{reply: :ok, status_code: 200, parsed_body: "<h1>HTML</h1>"} =
             ResponseTestClient.get("/html")
  end
end
