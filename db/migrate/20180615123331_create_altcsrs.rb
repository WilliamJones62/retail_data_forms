class CreateAltcsrs < ActiveRecord::Migration[5.1]
  def change
    create_table :altcsrs do |t|
      t.string :usualcsr
      t.string :altcsr
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
