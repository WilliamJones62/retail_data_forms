class RemoveStartdcFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :startdc, :date
  end
end
