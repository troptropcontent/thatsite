class SwitchReferenceFromSiteToBusiness < ActiveRecord::Migration[7.0]
  def change
    remove_reference :sites, :business, index: true, foreign_key: true
    add_reference :businesses, :site, index: true, foreign_key: true
  end
end
