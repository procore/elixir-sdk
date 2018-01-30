defmodule DefinedTypes do
  @type non_error_status_code :: 100..399
  @type string_or_nil :: String.t() | nil
  @type pos_integer_or_nil :: pos_integer | nil
  @type non_neg_integer_or_nil :: non_neg_integer | nil
  @type boolean_or_nil :: boolean | nil
end
