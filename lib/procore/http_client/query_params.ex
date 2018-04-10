defmodule Procore.HttpClient.QueryParams do
  def build(%{} = params) do
    [query: build_keyword(params)]
  end

  defp build_keyword(params) do
    params
    |> Enum.into(Keyword.new(), fn {key, val} -> {String.to_atom(key), val} end)
  end
end
