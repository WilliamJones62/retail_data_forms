class RemoveStartarFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :startar, :date
  end
end
