class AddNullToQueryInContexts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :contexts, :query, false
  end
end
