class RemoveAltrepFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :altrep, :string
  end
end
