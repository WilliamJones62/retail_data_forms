class RemoveStartFromDontcalls < ActiveRecord::Migration[5.1]
  def change
    remove_column :dontcalls, :start, :date
  end
end
