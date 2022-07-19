class CreateActivityDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :descriptions do |t|
      t.string :content,  null: false
      t.string :name,  null: false
      t.references :business, null: false, foreign_key: true
      t.timestamps
    end
  end
end
