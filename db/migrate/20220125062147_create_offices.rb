class CreateOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :offices do |t|
      t.references :business, null: false, foreign_key: true
      t.string :address_full, null: false
      t.string :address_complement
      t.string :address_zipcode, null: false
      t.string :addresse_city, null: false
      t.string :name

      t.timestamps
    end
  end
end
