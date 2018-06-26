class RemoveStartFromAltcsrs < ActiveRecord::Migration[5.1]
  def change
    remove_column :altcsrs, :start, :date
  end
end
