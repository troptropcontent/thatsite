class AddPhoneToOffices < ActiveRecord::Migration[7.0]
  def change
    add_column :offices, :phone, :string
  end
end
