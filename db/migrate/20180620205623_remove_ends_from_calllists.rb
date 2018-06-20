class RemoveEndsFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :ends, :date
  end
end
