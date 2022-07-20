class CreateCorePagesContextData < ActiveRecord::Migration[7.0]
  def change
    create_table :context_data do |t|
      t.references :holder, polymorphic: true, null: false
      t.references :context, null: false, foreign_key: true

      t.timestamps
    end
  end
end
