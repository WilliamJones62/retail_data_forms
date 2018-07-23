class AddNotesToCalllists < ActiveRecord::Migration[5.1]
  def change
    add_column :calllists, :notes, :string
  end
end
