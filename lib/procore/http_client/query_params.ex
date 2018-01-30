defmodule Procore.HttpClient.QueryParams do
  def build(%{} = params) do
    Keyword.new([{:params, build_tuples(params)}])
  end

  defp build_tuples(params) do
    params
    |> Enum.into([], fn {key, val} -> {key, val} end)
  end
end
