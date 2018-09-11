defmodule Procore.HttpClient.QueryParams do
  @moduledoc """
  Converts maps to formatted query params for the http client.
  """

  @spec build(map) :: map()
  def build(%{} = params) do
    query =
      params
      |> Enum.map(&build_map/1)
      |> List.flatten()
      |> Map.new()

    [query: query]
  end

  # %{"foo" => "bar", "nested" => %{"name" => "mike"}}
  # %{"foo" => "bar", "nested[name]" => "mike"}}
  defp build_map({key, value}) when is_map(value) do
    Enum.map(value, fn {nested_key, nested_value} ->
      build_map({"#{key}[#{nested_key}]", nested_value})
    end)
  end

  defp build_map({key, value}), do: {key, value}
end
