class CreateDontcalls < ActiveRecord::Migration[5.1]
  def change
    create_table :dontcalls do |t|
      t.string :customer
      t.string :shipto
      t.string :part
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
