defmodule Tesla.Middleware.AuthorizationOAuth do
  @behaviour Tesla.Middleware

  def call(env, next, token: token) do
    env
    |> add_auth_header(token)
    |> Tesla.run(next)
  end

  defp add_auth_header(env, token) do
    %{env | headers: [{"Authorization", "Bearer #{token.()}"} | env.headers]}
  end

  def headers do
    {:ok, vsn} = :application.get_key(:my_app, :vsn)
    [{"Content-type", "application/json"}, {"Accept", "application/json"}, {"Procore-Sdk-Version", List.to_string(vsn)}]
  end
end
