class AddDontcallsStartToDontcalls < ActiveRecord::Migration[5.1]
  def change
    add_column :dontcalls, :dontcalls_start, :date
  end
end
