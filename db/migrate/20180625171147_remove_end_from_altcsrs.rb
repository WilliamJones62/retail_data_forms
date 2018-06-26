class RemoveEndFromAltcsrs < ActiveRecord::Migration[5.1]
  def change
    remove_column :altcsrs, :end, :date
  end
end
