class AddCalledToCalllists < ActiveRecord::Migration[5.1]
  def change
    add_column :calllists, :called, :boolean
  end
end
