class AddNullToContentAndNameInTexts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :texts, :content, false
    change_column_null :texts, :name, false
  end
end
