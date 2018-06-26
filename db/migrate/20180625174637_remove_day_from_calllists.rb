class RemoveDayFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :day, :string
  end
end
