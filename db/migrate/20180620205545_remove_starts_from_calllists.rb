class RemoveStartsFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :starts, :date
  end
end
