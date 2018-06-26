class AddDontcallsEndToDontcalls < ActiveRecord::Migration[5.1]
  def change
    add_column :dontcalls, :dontcalls_end, :date
  end
end
