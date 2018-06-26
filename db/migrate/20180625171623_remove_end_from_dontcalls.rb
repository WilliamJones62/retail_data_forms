class RemoveEndFromDontcalls < ActiveRecord::Migration[5.1]
  def change
    remove_column :dontcalls, :end, :date
  end
end
