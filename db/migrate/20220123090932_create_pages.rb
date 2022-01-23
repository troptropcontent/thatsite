class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :type
      t.references :site, type: :uuid
      t.timestamps
    end
  end
end
