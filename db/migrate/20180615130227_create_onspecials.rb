class CreateOnspecials < ActiveRecord::Migration[5.1]
  def change
    create_table :onspecials do |t|
      t.string :customer
      t.string :part
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
