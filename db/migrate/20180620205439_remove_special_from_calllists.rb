class RemoveSpecialFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :special, :boolean
  end
end
