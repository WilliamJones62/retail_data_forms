class AddAltcsrsEndToAltcsrs < ActiveRecord::Migration[5.1]
  def change
    add_column :altcsrs, :altcrs_end, :date
  end
end
