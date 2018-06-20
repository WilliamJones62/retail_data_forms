class RemoveEnddcFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :enddc, :date
  end
end
