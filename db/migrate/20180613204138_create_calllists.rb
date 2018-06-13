class CreateCalllists < ActiveRecord::Migration[5.1]
  def change
    create_table :calllists do |t|
      t.string, :day
      t.string, :custname
      t.string, :custcode
      t.string, :shipto
      t.string, :rep
      t.string, :csr
      t.string, :dept
      t.string, :item
      t.string, :phone
      t.string, :manager
      t.integer, :totalitems
      t.boolean, :dontcall
      t.text, :reason
      t.date, :startdc
      t.date, :enddc
      t.boolean, :special
      t.date, :starts
      t.date, :ends
      t.string, :altrep
      t.date, :startar
      t.date :endar

      t.timestamps
    end
  end
end
