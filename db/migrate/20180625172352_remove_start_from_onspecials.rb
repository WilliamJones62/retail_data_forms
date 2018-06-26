class RemoveStartFromOnspecials < ActiveRecord::Migration[5.1]
  def change
    remove_column :onspecials, :start, :date
  end
end
