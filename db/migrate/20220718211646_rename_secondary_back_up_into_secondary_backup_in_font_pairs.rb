class RenameSecondaryBackUpIntoSecondaryBackupInFontPairs < ActiveRecord::Migration[7.0]
  def change
    rename_column :font_pairs, :secondary_back_up, :secondary_backup
  end
end
