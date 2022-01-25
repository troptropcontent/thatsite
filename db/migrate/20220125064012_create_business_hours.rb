class CreateBusinessHours < ActiveRecord::Migration[7.0]
  def change
    create_table :business_hours do |t|
      t.references :office, null: false, foreign_key: true
      t.integer :weekday, null: false
      t.time :opens_at, null: false
      t.time :closes_at, null: false

      t.timestamps
    end
  end
end
