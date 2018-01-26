defmodule Procore.Resources.Offices.ResponseBodyTypes.ListOffices do
  @type t ::
          nonempty_list(%{
            (address :: String.t()) => DefinedTypes.string_or_nil(),
            (city :: String.t()) => DefinedTypes.string_or_nil(),
            (country_code :: String.t()) => DefinedTypes.string_or_nil(),
            (division :: String.t()) => DefinedTypes.string_or_nil(),
            (fax :: String.t()) => DefinedTypes.string_or_nil(),
            (id :: String.t()) => pos_integer,
            (name :: String.t()) => String.t(),
            (phone :: String.t()) => DefinedTypes.string_or_nil(),
            (state_code :: String.t()) => DefinedTypes.string_or_nil(),
            (zip :: String.t()) => DefinedTypes.string_or_nil()
          })
end
