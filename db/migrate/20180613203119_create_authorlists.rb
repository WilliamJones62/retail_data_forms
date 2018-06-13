class CreateAuthorlists < ActiveRecord::Migration[5.1]
  def change
    create_table :authorlists do |t|
      t.string, :partcode
      t.string, :dept
      t.string, :custcode
      t.integer, :turns
      t.integer, :seq
      t.integer :priority

      t.timestamps
    end
  end
end
