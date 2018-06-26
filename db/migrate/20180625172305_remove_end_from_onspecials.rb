class RemoveEndFromOnspecials < ActiveRecord::Migration[5.1]
  def change
    remove_column :onspecials, :end, :date
  end
end
