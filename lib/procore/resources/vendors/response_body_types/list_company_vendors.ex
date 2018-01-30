defmodule Procore.Resources.Vendors.ResponseBodyTypes.ListCompanyVendors do
  alias Procore.DefinedTypes

  @type t ::
          list(%{
            (prequalified :: String.t()) => boolean,
            (abbreviated_name :: String.t()) => DefinedTypes.string_or_nil(),
            (origin_data :: String.t()) => DefinedTypes.string_or_nil(),
            (company :: String.t()) => String.t(),
            (notes :: String.t()) => DefinedTypes.string_or_nil(),
            (labor_union :: String.t()) => DefinedTypes.string_or_nil(),
            (license_number :: String.t()) => DefinedTypes.string_or_nil(),
            (business_register :: String.t()) => %{
              (id :: String.t()) => pos_integer,
              (type :: String.t()) => String.t(),
              (identifier :: String.t()) => String.t()
            },
            (id :: String.t()) => pos_integer,
            (logo :: String.t()) => DefinedTypes.string_or_nil(),
            (origin_code :: String.t()) => DefinedTypes.string_or_nil(),
            (country_code :: String.t()) => DefinedTypes.string_or_nil(),
            (non_union_prevailing_wage :: String.t()) => boolean,
            (address :: String.t()) => DefinedTypes.string_or_nil(),
            (synced_to_erp :: String.t()) => boolean,
            (bidding :: String.t()) =>
              %{
                (affirmative_action :: String.t()) => boolean,
                (african_american_business :: String.t()) => boolean,
                (asian_american_business :: String.t()) => boolean,
                (certified_business_enterprise :: String.t()) => boolean,
                (disadvantaged_business :: String.t()) => boolean,
                (eight_a_business :: String.t()) => boolean,
                (hispanic_business :: String.t()) => boolean,
                (historically_underutilized_business :: String.t()) => boolean,
                (minority_business_enterprise :: String.t()) => boolean,
                (native_american_business :: String.t()) => boolean,
                (sdvo_business :: String.t()) => boolean,
                (small_business :: String.t()) => boolean,
                (womens_business :: String.t()) => boolean
              }
              | nil,
            (primary_contact :: String.t()) =>
              %{
                (id :: String.t()) => pos_integer,
                (first_name :: String.t()) => DefinedTypes.string_or_nil(),
                (last_name :: String.t()) => String.t(),
                (email_address :: String.t()) => String.t(),
                (created_at :: String.t()) => String.t(),
                (updated_at :: String.t()) => String.t()
              }
              | nil,
            (vendor_group :: String.t()) =>
              %{
                (id :: String.t()) => 1,
                (name :: String.t()) => String.t()
              }
              | nil,
            (authorized_bidder :: String.t()) => boolean,
            (email_address :: String.t()) => String.t(),
            (created_at :: String.t()) => String.t(),
            (name :: String.t()) => String.t(),
            (business_phone :: String.t()) => DefinedTypes.string_or_nil(),
            (fax_number :: String.t()) => DefinedTypes.string_or_nil(),
            (union_member :: String.t()) => boolean,
            (city :: String.t()) => DefinedTypes.string_or_nil(),
            (origin_id :: String.t()) => DefinedTypes.string_or_nil(),
            (website :: String.t()) => DefinedTypes.string_or_nil(),
            (attachments :: String.t()) =>
              [
                %{
                  (id :: String.t()) => pos_integer,
                  (url :: String.t()) => String.t(),
                  (filename :: String.t()) => String.t()
                }
              ]
              | [],
            (mobile_phone :: String.t()) => DefinedTypes.string_or_nil(),
            (zip :: String.t()) => DefinedTypes.string_or_nil(),
            (is_active :: String.t()) => boolean,
            (project_ids :: String.t()) => nonempty_list(pos_integer) | [],
            (updated_at :: String.t()) => String.t(),
            (state_code :: String.t()) => DefinedTypes.string_or_nil()
          })
end
