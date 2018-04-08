defmodule Procore.ResponseResult do
  defstruct [:reply, :status_code, :parsed_body]

  @type t :: %__MODULE__{reply: atom, status_code: integer, parsed_body: map}
end
