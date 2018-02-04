defmodule Procore.ResponseResult do
  defstruct [:reply, :status_code, :parsed_body]

  @type t :: %__MODULE__{reply: atom, status_code: integer, parsed_body: map}

  @spec parse_json_body(binary) :: any
  def parse_json_body(response_body) when is_binary(response_body) do
    Poison.decode!(response_body)
  end
end
