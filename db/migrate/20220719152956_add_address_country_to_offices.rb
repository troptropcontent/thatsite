class AddAddressCountryToOffices < ActiveRecord::Migration[7.0]
  def change
    add_column :offices, :address_country, :string, null: false
  end
end
