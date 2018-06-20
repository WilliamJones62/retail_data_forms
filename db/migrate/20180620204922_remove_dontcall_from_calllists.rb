class RemoveDontcallFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :dontcall, :boolean
  end
end
