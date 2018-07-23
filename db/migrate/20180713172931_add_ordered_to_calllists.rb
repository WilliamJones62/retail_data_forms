class AddOrderedToCalllists < ActiveRecord::Migration[5.1]
  def change
    add_column :calllists, :ordered, :boolean
  end
end
