class ChangeAddresseCityIntoAddressCityInOffices < ActiveRecord::Migration[7.0]
  def change
    rename_column :offices, :addresse_city, :address_city
  end
end
