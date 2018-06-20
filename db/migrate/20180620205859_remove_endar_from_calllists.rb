class RemoveEndarFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :endar, :date
  end
end
