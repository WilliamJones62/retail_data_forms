class AddInstructionsToCalllists < ActiveRecord::Migration[5.1]
  def change
    add_column :calllists, :instructions, :string
  end
end
