defmodule Procore.Resources.Users.ResponseBodyTypes.ListCompanyUsers do
  @type t ::
          nonempty_list(%{
            (address :: String.t()) => DefinedTypes.string_or_nil(),
            (avatar :: String.t()) => DefinedTypes.string_or_nil(),
            (business_phone :: String.t()) => DefinedTypes.string_or_nil(),
            (business_phone_extension :: String.t()) => DefinedTypes.string_or_nil(),
            (city :: String.t()) => DefinedTypes.string_or_nil(),
            (country_code :: String.t()) => DefinedTypes.string_or_nil(),
            (created_at :: String.t()) => String.t(),
            (email_address :: String.t()) => String.t(),
            (email_signature :: String.t()) => String.t(),
            (employee_id :: String.t()) => DefinedTypes.pos_integer_or_nil(),
            (erp_integrated_accountant :: String.t()) => boolean,
            (fax_number :: String.t()) => DefinedTypes.string_or_nil(),
            (first_name :: String.t()) => DefinedTypes.string_or_nil(),
            (id :: String.t()) => pos_integer,
            (initials :: String.t()) => DefinedTypes.string_or_nil(),
            (is_active :: String.t()) => boolean,
            (is_employee :: String.t()) => boolean,
            (job_title :: String.t()) => DefinedTypes.string_or_nil(),
            (last_login_at :: String.t()) => DefinedTypes.string_or_nil(),
            (last_name :: String.t()) => String.t(),
            (mobile_phone :: String.t()) => DefinedTypes.string_or_nil(),
            (name :: String.t()) => String.t(),
            (notes :: String.t()) => String.t(),
            (origin_data :: String.t()) => DefinedTypes.string_or_nil(),
            (origin_id :: String.t()) => DefinedTypes.string_or_nil(),
            (permission_template :: String.t()) => %{
              (id :: String.t()) => pos_integer,
              (name :: String.t()) => String.t()
            },
            (state_code :: String.t()) => DefinedTypes.string_or_nil(),
            (updated_at :: String.t()) => String.t(),
            (vendor :: String.t()) =>
              %{(id :: String.t()) => pos_integer, (name :: String.t()) => String.t()} | nil,
            (welcome_email_sent_at :: String.t()) => DefinedTypes.string_or_nil(),
            (zip :: String.t()) => DefinedTypes.string_or_nil()
          })
end
