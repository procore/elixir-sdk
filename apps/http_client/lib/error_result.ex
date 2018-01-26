defmodule ErrorResult do
  defstruct [:reply, :reason]

  @type t :: %__MODULE__{reply: atom, reason: any}
end
